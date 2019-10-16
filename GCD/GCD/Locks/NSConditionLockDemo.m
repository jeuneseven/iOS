//
//  NSConditionLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/16.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()

@property (nonatomic, strong) NSMutableArray *dataArray;
//NSCondition是对pthread_mutex_cond和pthread_mutex的封装，不需要再另外使用锁了
@property (nonatomic, strong) NSCondition *condition;

@end

@implementation NSConditionLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.condition = [[NSCondition alloc] init];
        
        self.dataArray = [NSMutableArray array];
    }
    
    return self;
}

- (void)log
{
    [NSThread detachNewThreadSelector:@selector(remove) toTarget:self withObject:nil];
    
    [NSThread detachNewThreadSelector:@selector(add) toTarget:self withObject:nil];
}

- (void)add {
    [self.condition lock];
    
    [self.dataArray addObject:@"123"];
    NSLog(@"添加元素");
    //通知并唤醒线程
    [self.condition signal];
    
    [self.condition unlock];
}

- (void)remove {
    [self.condition lock];
    
    if (self.dataArray.count == 0) {
        //等待，线程会睡觉，睡觉时会将锁放开，即解锁，传入的条件由其他线程唤醒
        [self.condition wait];
    }
    
    [self.dataArray removeLastObject];
    
    NSLog(@"删除元素");
    [self.condition unlock];
}

@end
