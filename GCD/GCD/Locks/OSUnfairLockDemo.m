//
//  OSUnfairLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()
//iOS 10开始支持，等待os_unfair_lock的线程是出于休眠状态的，并非忙等
@property (nonatomic, assign) os_unfair_lock ticketSpinLock;

@property (nonatomic, assign) os_unfair_lock moneySpinLock;

@end

@implementation OSUnfairLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.ticketSpinLock = OS_UNFAIR_LOCK_INIT;
        self.moneySpinLock = OS_UNFAIR_LOCK_INIT;
    }
    
    return self;
}

- (void)drawMoney
{
    os_unfair_lock_lock(&_moneySpinLock);
    
    [super drawMoney];
    //加锁之后要记得解锁，如果忘记解锁，会形成死锁状态
    os_unfair_lock_unlock(&_moneySpinLock);
}

- (void)saveMoney
{
    os_unfair_lock_lock(&_moneySpinLock);
    
    [super saveMoney];
    
    os_unfair_lock_unlock(&_moneySpinLock);
}

- (void)saleTicket
{
    os_unfair_lock_lock(&_ticketSpinLock);
    
    [super saleTicket];
    
    os_unfair_lock_unlock(&_ticketSpinLock);
}

@end
