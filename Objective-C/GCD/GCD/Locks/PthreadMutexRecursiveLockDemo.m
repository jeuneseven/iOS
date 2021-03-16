//
//  PthreadMutexRecursiveLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/14.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "PthreadMutexRecursiveLockDemo.h"
#import <pthread.h>

@interface PthreadMutexRecursiveLockDemo ()

@property (nonatomic, assign) pthread_mutex_t mutex;

@end

@implementation PthreadMutexRecursiveLockDemo

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
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initLock:&_mutex];
    }
    
    return self;
}

- (void)dealloc {
    //销毁锁
    pthread_mutex_destroy(&_mutex);
}

- (void)log
{
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"%s", __func__);
    
    static NSInteger count = 0;
    
    if (count < 10) {
        count++;
        [self log];
    }
    
    //会造成死锁，log2中使用另一把锁就可以解决
//    [self log2];
    
    pthread_mutex_unlock(&_mutex);
}

- (void)log2
{
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"%s", __func__);
    
    pthread_mutex_unlock(&_mutex);
}

@end
