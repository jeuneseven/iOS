//
//  main.m
//  KVC
//
//  Created by kkk on 2019/7/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"
#import "SomeObserver.h"
#import "KVCClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *someObject = [[SomeClass alloc] init];
        someObject.otherObject = [[OtherClass alloc] init];
        //KVC的基本使用：set和get
        [someObject setValue:@1 forKeyPath:@"otherObject.intValue"];
        NSNumber *intValue = [someObject valueForKeyPath:@"otherObject.intValue"];
        NSLog(@"intValue == %ld", [intValue integerValue]);
        
        SomeObserver *observer = [[SomeObserver alloc] init];
        OtherClass *otherObject = [[OtherClass alloc] init];
        //添加KVO监听
        [otherObject addObserver:observer forKeyPath:@"intValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        //使用KVC修改属性（会触发KVO）即使对象没有该属性，只要对象有对应的成员变量就会触发KVO
        [otherObject setValue:@10 forKey:@"intValue"];
        //移除KVO
        [otherObject removeObserver:observer forKeyPath:@"intValue"];
        
        //验证KVC设置过程
        KVCClass *aObject = [[KVCClass alloc] init];
        //添加KVO监听
        [aObject addObserver:observer forKeyPath:@"intValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        /**
         KVC会按照setKey、_setKey的顺序进行设置，如果找到对应的两个方法之一，就传值设置
         如果没有，那么会询问类的方法accessInstanceVariablesDirectly，若返回值为NO，那么会抛出异常 setValue:forUndefinedKey:，证明类不允许访问成员变量
         若accessInstanceVariablesDirectly方法返回YES，则会按照_key、_isKey、key、isKey的顺序查找成员变量，如果查到了直接赋值，如果都没有找到，也会抛出异常 setValue:forUndefinedKey:。
         */
        //调用过程：
        //aObject willChangeValueForKey
        //aObject->intValue = 11
        //aObject didChangeValueForKey
        [aObject setValue:@11 forKey:@"intValue"];
        
        //移除KVO
        [aObject removeObserver:observer forKeyPath:@"intValue"];
        
        /**
         KVC获取值的过程:
         按照getKey、key、isKey、_key的顺序查找，找到方法后直接调用并返回
         如果没找到，会询问 accessInstanceVariablesDirectly 方法，如果返回NO，会调用valueForUndefinedKey，并抛出异常NSUnknownKeyException；如果返回YES，按照key、_isKey、key、isKey的顺序查找成员变量，如果查到了，直接返回该成员变量的值，如果没查找到会调用valueForUndefinedKey，并抛出异常NSUnknownKeyException
         */
        
        NSLog(@"%@", [aObject valueForKey:@"intValue"]);
        
        NSLog(@"%s", __func__);
    }
    return 0;
}
