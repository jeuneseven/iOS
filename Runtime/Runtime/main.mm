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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SubSubSomeClass *objectMethodSend = [[SubSubSomeClass alloc] init];
        /*
         方法调用的过程：
         0.如果第一个参数为空，直接返回nil
         1.发送消息
         2.动态解析
         3.消息转发
         */
        
        
//        objc_msgSend(objectMethodSend, sel_registerName("noImpInstanceMethod"));
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
