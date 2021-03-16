//
//  PthreadMutexConditionLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/15.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "PthreadMutexConditionLockDemo.h"
#import <pthread.h>
//实现线程等待功能（生产者-消费者模式）
@interface PthreadMutexConditionLockDemo ()

@property (nonatomic, assign) pthread_mutex_t mutex;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation PthreadMutexConditionLockDemo

- (void)initLock:(pthread_mutex_t *)lock {
    //初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    //递归锁：允许同一线程对同一把锁重复加锁
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    //初始化锁，属性值可以传NULL，等价于PTHREAD_MUTEX_DEFAULT
    pthread_mutex_init(lock, &attr);
    //销毁属性
    pthread_mutexattr_destroy(&attr);
    
    pthread_cond_init(&_cond, NULL);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initLock:&_mutex];
        
        self.dataArray = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc {
    //销毁锁
    pthread_mutex_destroy(&_mutex);
    //销毁条件
    pthread_cond_destroy(&_cond);
}

- (void)log
{
    [NSThread detachNewThreadSelector:@selector(remove) toTarget:self withObject:nil];
    
    [NSThread detachNewThreadSelector:@selector(add) toTarget:self withObject:nil];
}

- (void)add {
    pthread_mutex_lock(&_mutex);
    
    [self.dataArray addObject:@"123"];
    NSLog(@"添加元素");
    //通知并唤醒线程
    pthread_cond_signal(&_cond);
    //多条线程都在等待时，可以使用广播，激活所有等待线程
//    pthread_cond_broadcast(&_cond);
    
    pthread_mutex_unlock(&_mutex);
}

- (void)remove {
    pthread_mutex_lock(&_mutex);
    
    if (self.dataArray.count == 0) {
        //等待，线程会睡觉，睡觉时会将锁放开，即解锁，传入的条件由其他线程唤醒
        pthread_cond_wait(&_cond, &_mutex);
    }
    
    [self.dataArray removeLastObject];
    
    NSLog(@"删除元素");
    
    pthread_mutex_unlock(&_mutex);
}

@end
