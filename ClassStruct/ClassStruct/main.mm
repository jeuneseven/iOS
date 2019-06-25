//
//  main.m
//  ClassStruct
//
//  Created by kkk on 2019/6/24.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassInfo.h"

@protocol MyProtocol <NSObject>

@required
- (void)protocolInstanceMethod;
+ (void)protocolClassMethod;
@optional
- (void)protocolOptionalInstanceMethod;
- (void)protocolOptionalClassMethod;

@end

@protocol MySubProtocol <NSObject>

@required
- (void)subProtocolInstanceMethod;
+ (void)subProtocolClassMethod;
@optional
- (void)subProtocolOptionalInstanceMethod;
- (void)subProtocolOptionalClassMethod;

@end

@interface SomeClass : NSObject <MyProtocol, MySubProtocol> {
    @public
    NSInteger integerValue;
}
@property (nonatomic, assign) int intVaule;
@property (nonatomic, strong) NSString *stringValue;
@property (class, nonatomic, strong) NSString *classStringValue;

- (void)instanceMethod;
+ (void)classMethod;

@end

@implementation SomeClass

- (void)instanceMethod {
    NSLog(@"%s %p", __func__, self);
}

+ (void)classMethod {
    NSLog(@"%s %p", __func__, self);
}

@end

@interface OtherClass : SomeClass <MySubProtocol>

@property (nonatomic, assign) double doubleValue;
@property (nonatomic, strong) NSString *subStringValue;
@property (class, nonatomic, strong) NSString *subClassStringValue;

- (void)otherInstanceMethod;
+ (void)otherClassMethod;

@end

@implementation OtherClass

- (void)otherInstanceMethod {
    NSLog(@"%s %p", __func__, self);
}

+ (void)otherClassMethod {
    NSLog(@"%s %p", __func__, self);
}

@end

@interface TheOtherClass : SomeClass

@end

@implementation TheOtherClass

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        my_objc_class *someClass = (__bridge my_objc_class*)[SomeClass class];
        my_objc_class *otherClass = (__bridge my_objc_class*)[OtherClass class];
        my_objc_class *theOtherClass = (__bridge my_objc_class*)[TheOtherClass class];
        
        /*
            类的属性、实例方法、协议存在于类中
            properties、methods、protocols
            还可以知道继承信息，firstSubclass，如果多个类继承自该类，可获取最新的一个继承自该类的类
            协议信息只能够知道遵守了多少个协议
         
            ro->ivars中存储了成员变量信息
         */
        class_rw_t *someClassData = someClass->data();
        class_rw_t *otherClassData = otherClass->data();
        class_rw_t *theOtherClassData = theOtherClass->data();
        /*
            类的类属性、类方法存在于元类中，属性、实例方法为NULL
         */
        class_rw_t *someClassMetaData = someClass->metaClass()->data();
        class_rw_t *otherClassMetaData = otherClass->metaClass()->data();
        class_rw_t *theOtherClassMetaData = theOtherClass->metaClass()->data();
        
        NSLog(@"%s", __func__);
    }
    return 0;
}
