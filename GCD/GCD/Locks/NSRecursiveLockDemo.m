//
//  NSRecursiveLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/16.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSRecursiveLockDemo.h"

@interface NSRecursiveLockDemo ()
//NSRecursiveLock是对pthread_mutex的递归锁的面向对象封装
@property (nonatomic, strong) NSRecursiveLock *recursiveLock;

@end

@implementation NSRecursiveLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.recursiveLock = [[NSRecursiveLock alloc] init];
    }
    
    return self;
}

- (void)log
{
    [self.recursiveLock lock];
    
    NSLog(@"%s", __func__);
    
    static NSInteger count = 0;
    
    if (count < 10) {
        count++;
        [self log];
    }
    
    [self.recursiveLock unlock];
}

@end
