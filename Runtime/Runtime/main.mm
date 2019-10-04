//
//  main.m
//  Runtime
//
//  Created by kkk on 2019/10/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"
#import <objc/runtime.h>
#import "ClassInfo.h"
#import "SubSubSomeClass.h"
#import "OtherClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        OtherClass *dynamicObject = [[OtherClass alloc] init];
        dynamicObject.intValue = 11;
        
        SubSomeClass *subObjectMsgSend = [[SubSomeClass alloc] init];
        [subObjectMsgSend notImpInstanceMethod];
        [SubSomeClass notImpClassMethod];
        
        [subObjectMsgSend otherNotImpInstanceMethod];
        [SubSomeClass otherNotImpClassMethod];
        
        [subObjectMsgSend otherNotImpInstanceMethod:10];
        
        SubSubSomeClass *objectMethodSend = [[SubSubSomeClass alloc] init];
        /*
         方法调用的过程：消息机制，给方法调用者发送消息，消息接受者为第一个参数，消息名称为第二个参数
         0.如果第一个参数(消息接收者)为空，直接返回
         1.发送消息
            1)从消息接收者的cache中查找方法
                a)如果找到方法，调用方法，退出查找
                b)如果没找到，会从class_rw_t中查找方法（a.已经排序的，使用二分查找 b.没有排序的，使用线性查找）
                c)如果找到方法，结束查找，并将方法缓存到接收者的cache中
        2)如果没有找到，会通过接收者的superclass指针找到父类，然后从父类的cache中查找方法，如果没有找到，会从父类的class_rw_t中查找方法，找到方法后结束查找，并将方法缓存到接收者的cache中，如果还没有找到，会判断当前类是否还有父类，递归查找
            3)所有父类都遍历后，没有查找到，会进入动态解析
         2.动态解析（如果没有实现要求实现的两个方法，将会回到第一步重新查找一遍）
            1)判断是否有过动态解析，如果没有才继续，如果有，跳过本步骤
            2)开发者可以通过实现resolveClassMethod:或resolveInstanceMethod:方法来动态的添加类方法或实例方法
            3)回到消息接受者的cache中进行查找，重复第一步发送消息
         3.消息转发:当前接受者无法处理消息，需要转发给其他类（并未开源）
            1)调用forwardingTargetForSelector:，返回值不为nil，调用objc_msgSend(返回值，SEL)
            2)forwardingTargetForSelector:返回值为nil，调用methodSignatureForSelector:，返回值不为nil时，调用forwardInvocation:让开发者处理
            3)methodSignatureForSelector:如果返回nil，会调用NSObject的doesNotRecognizeSelector:方法，抛出异常
         4.unrecognized selector sent to instance
         */
        
//        objc_msgSend(objectMethodSend, sel_registerName("noImpInstanceMethod"));
//        sel_registerName("noImpInstanceMethod") == @selector(noImpInstanceMethod) 地址相同
        [objectMethodSend noImpInstanceMethod];
//        objc_msgSend(objc_getClass("SubSubSomeClass"), sel_registerName("noImpClassMethod"));
        [SubSubSomeClass noImpClassMethod];
        
        SubSubSomeClass *subObject = [[SubSubSomeClass alloc] init];
        my_objc_class *subClass = (__bridge my_objc_class *)[subObject class];
        //当缓存方法增多时，需要扩容，并且将之前的缓存方法清空，调用父类的方法也会缓存在自己的缓存方法列表中
        [subObject subSubSomeMethod];
        [subObject subSomeMethod];
        [subObject someMethod];
        //获取缓存中全部的方法
        cache_t cachets = subClass->cache;
        for (NSInteger i = 0; i < cachets._mask + 1; i++) {
            bucket_t bucket = cachets._buckets[i];
            NSLog(@"%s %p", (char *)bucket._key, bucket._imp);
        }
        
        NSLog(@"");
        
        SomeClass *object = [[SomeClass alloc] init];
        object.boolValue = YES;
        object.boolValue = NO;
        NSLog(@"object.boolValue == %d", object.boolValue);
        
        object.boolTypeValue = YES;
        object.boolTypeValue = NO;
        NSLog(@"object.boolTypeValue == %d", object.boolTypeValue);
        
        object.isTall = YES;
        object.isRich = YES;
        object.isHandsome = NO;
        NSLog(@"object.isTall == %d object.isRich == %d object.isHandsome == %d", object.isTall, object.isRich, object.isHandsome);
        
//        object.customType = CustomEnumTypeOne | CustomEnumTypeFour;
//        NSLog(@"object.customType == %d", object.customType);
    }
    return 0;
}
