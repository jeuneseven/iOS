//
//  OSSpinLockDemo.m
//  GCD
//
//  Created by 李占昆 on 2019/10/11.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo ()

//自旋锁是等待锁的线程会一直处于忙等状态，一直占用CPU资源，不再安全，可能会出现优先级反转问题，如果线程是使用休眠的方式就可以解决这个问题
//操作系统在调度进程、线程时会使用时间片调度算法，即分给多个线程每个线程一段时间来执行，这样看起来就像多个线程同时执行一样，但多个线程如果优先级不同时，就会发生优先级反转，造成高优线程等待低优线程的现象，锁也有可能一直无法解开，造成死锁现象
//自旋锁要定义为全局变量，否则多个线程访问时每个线程都会创建一个自己的锁，无法达到锁定线程的目的
@property (nonatomic, assign) OSSpinLock ticketSpinLock;
//存取钱要用同一把锁，因为不能同时存钱和取钱，多个线程访问同一块变量时才需要加锁，不同任务无需加同一把锁
@property (nonatomic, assign) OSSpinLock moneySpinLock;

@end

@implementation OSSpinLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.ticketSpinLock = OS_SPINLOCK_INIT;
        self.moneySpinLock = OS_SPINLOCK_INIT;
    }
    
    return self;
}

- (void)drawMoney
{
    OSSpinLockLock(&_moneySpinLock);
    
    [super drawMoney];
    
    OSSpinLockUnlock(&_moneySpinLock);
}

- (void)saveMoney
{
    //还可以使用返回BOOL值的尝试加锁
    //    OSSpinLockTry(&_moneySpinLock)
    OSSpinLockLock(&_moneySpinLock);
    
    [super saveMoney];
    
    OSSpinLockUnlock(&_moneySpinLock);
}

- (void)saleTicket
{
    //加锁，其他线程访问时，会判断该锁是否已经被锁住，如果锁住就等待解锁
    OSSpinLockLock(&_ticketSpinLock);
    
    [super saleTicket];
    
    OSSpinLockUnlock(&_ticketSpinLock);
}

@end
