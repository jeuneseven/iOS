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

@interface SomeClass : NSObject <MyProtocol>
@property (nonatomic, assign) int intVaule;

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
