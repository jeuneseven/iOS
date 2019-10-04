//
//  SubSomeClass.m
//  Runtime
//
//  Created by kkk on 2019/10/3.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSomeClass.h"
#import "OtherClass.h"

@implementation SubSomeClass

- (void)subSomeMethod {
    NSLog(@"%s", __func__);
}
//该方法定制性比 forwardingTargetForSelector: 更高
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(otherNotImpInstanceMethod)) {
        //如果返回nil，证明彻底不想处理该方法了，也就不会调用forwardInvocation:
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return [[[OtherClass alloc] init] methodSignatureForSelector:aSelector];
    } else if (aSelector == @selector(otherNotImpClassMethod)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    } else if (aSelector == @selector(otherNotImpInstanceMethod:)) {
        return [NSMethodSignature signatureWithObjCTypes:"l@:l"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}
//NSInvocation 封装方法调用
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(otherNotImpInstanceMethod:)) {
        NSInteger intValue;
        [anInvocation getArgument:&intValue atIndex:2];
        NSLog(@"intValue == %ld", intValue);
    }
    //可以什么都不做
    NSLog(@"%s", __func__);
//    anInvocation.target = [[OtherClass alloc] init];
//    [anInvocation invoke];
//    [anInvocation invokeWithTarget:[[OtherClass alloc] init]];
}
//类方法签名
+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(otherNotImpClassMethod)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}
//类方法调用
+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

//消息转发给其他类
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(notImpInstanceMethod)) {
        return [[OtherClass alloc] init];
    } else if (aSelector == @selector(otherNotImpInstanceMethod)) {
        return nil;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}
//让消息接受者调用方法，处理类方法
+ (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(notImpClassMethod)) {
        //objc_msgSend([[OtherClass alloc] init], @selector(notImpClassMethod))
        return [[OtherClass alloc] init];//也可以返回实例对象，只要实例对象实现了与类方法同名的实例方法即可
        return [OtherClass class];
    } else if (aSelector == @selector(otherNotImpClassMethod)) {
        return nil;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

@end
