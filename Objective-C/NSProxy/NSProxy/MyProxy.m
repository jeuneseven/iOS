//
//  MyProxy.m
//  NSProxy
//
//  Created by kkk on 2019/12/6.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "MyProxy.h"

@implementation MyProxy

+ (instancetype)proxyWithTarget:(id)target {
    MyProxy *proxy = [[MyProxy alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

@end
