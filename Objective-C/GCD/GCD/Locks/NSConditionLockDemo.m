//
//  NSConditionLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/16.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()
//NSConditionLock是对NSCondition的进一步封装，封装了条件值
@property (nonatomic, strong) NSConditionLock *conditionLock;

@end

@implementation NSConditionLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    
    return self;
}

- (void)log
{
    //用锁实现子线程串行效果
    [NSThread detachNewThreadSelector:@selector(remove) toTarget:self withObject:nil];
    
    [NSThread detachNewThreadSelector:@selector(add) toTarget:self withObject:nil];
}

- (void)add {
    //当条件为1时加锁，否则等待
    [self.conditionLock lockWhenCondition:1];
    
    NSLog(@"添加元素");
    //解开锁并将条件设置为2
    [self.conditionLock unlockWithCondition:2];
}

- (void)remove {
    //当条件为2时加锁，否则等待
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"删除元素");
    
    [self.conditionLock unlock];
}

@end
