//
//  SynchronizedDemo.m
//  GCD
//
//  Created by kkk on 2019/10/18.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SynchronizedDemo.h"
/**
    性能：
    os_unfair_lock>OSSpinLock（已废弃）>dispatch_semaphore_t>pthread_mutex_t>dispatch_queue_t>NSLock>NSCondition>pthread_mutex_t(递归锁)>NSRecursiveLock>NSConditionLock>@synchronized
 */
@implementation SynchronizedDemo

- (void)drawMoney
{
    //self为锁对象，即锁本身，保证每次锁的对象是一直的即可
    @synchronized (self) {
        [super drawMoney];
    }
}

- (void)saveMoney
{
    //synchronized是对mutex递归锁的封装
    @synchronized (self) {
        [super saveMoney];
    }
}

- (void)saleTicket
{
    //也可以使用类对象作为锁，synchronized将传入的对象作为key进行加锁
    @synchronized (self) {//objc_sync_enter
        [super saleTicket];
    }//objc_sync_exit
}

- (void)log {
    //递归锁
    @synchronized (self) {
        NSLog(@"%s", __func__);
        [self log];
    }
}

@end
