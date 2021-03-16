//
//  PthreadMutexLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "PthreadMutexLockDemo.h"
#import <pthread.h>

@interface PthreadMutexLockDemo ()
//非自旋锁，调用线程出于休眠中，属于低级锁
@property (nonatomic, assign) pthread_mutex_t ticketSpinLock;

@property (nonatomic, assign) pthread_mutex_t moneySpinLock;

@end

@implementation PthreadMutexLockDemo

- (void)initLock:(pthread_mutex_t *)lock {
    //初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    //设置属性类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    //初始化锁，属性值可以传NULL，等价于PTHREAD_MUTEX_DEFAULT
    pthread_mutex_init(lock, &attr);
    //销毁属性
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initLock:&_ticketSpinLock];
        [self initLock:&_moneySpinLock];
    }
    
    return self;
}

- (void)dealloc {
    //销毁锁
    pthread_mutex_destroy(&_ticketSpinLock);
    pthread_mutex_destroy(&_moneySpinLock);
}

- (void)drawMoney
{
    pthread_mutex_lock(&_moneySpinLock);
    
    [super drawMoney];
    
    pthread_mutex_unlock(&_moneySpinLock);
}

- (void)saveMoney
{
    pthread_mutex_lock(&_moneySpinLock);
    
    [super saveMoney];
    
    pthread_mutex_unlock(&_moneySpinLock);
}

- (void)saleTicket
{
    pthread_mutex_lock(&_ticketSpinLock);
    
    [super saleTicket];
    
    pthread_mutex_unlock(&_ticketSpinLock);
}

@end
