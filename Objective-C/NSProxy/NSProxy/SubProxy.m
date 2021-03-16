//
//  SubProxy.m
//  NSProxy
//
//  Created by kkk on 2019/12/6.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubProxy.h"

@implementation SubProxy

+ (instancetype)proxyWithTarget:(id)target {
    //无需init
    SubProxy *proxy = [SubProxy alloc];
    proxy.target = target;
    return proxy;
}
//调用方法
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
//返回消息转发类的方法签名
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

@end
