//
//  OtherClass.m
//  Runtime
//
//  Created by kkk on 2019/10/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "OtherClass.h"
#import <objc/runtime.h>

@implementation OtherClass
//告诉编译器不要自动生成setter、getter，也不要生成成员变量
@dynamic intValue;

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(setIntValue:)) {
        //添加方法
        return YES;
    } else if (sel == @selector(intValue)) {
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
//消息转发可以用来防止崩溃、收集信息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([self respondsToSelector:aSelector]) {
        return [super methodSignatureForSelector:aSelector];
    }
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"无法响应: %@", NSStringFromSelector(anInvocation.selector));
}

- (void)notImpInstanceMethod {
    NSLog(@"%s", __func__);
}

- (void)notImpClassMethod {
    NSLog(@"%s", __func__);
}

+ (void)notImpClassMethod {
    NSLog(@"%s", __func__);
}

- (void)otherNotImpInstanceMethod {
    NSLog(@"%s", __func__);
}

@end
