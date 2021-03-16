//
//  PthreadRWLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/20.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "PthreadRWLockDemo.h"
#import <pthread.h>

@interface PthreadRWLockDemo ()

@property (nonatomic, assign) pthread_rwlock_t rwLock;

@end

@implementation PthreadRWLockDemo

- (void)dealloc {
    pthread_rwlock_destroy(&_rwLock);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_rwlock_init(&_rwLock, NULL);
    }
    
    return self;
}

- (void)readWrite {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (NSInteger i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void)read {
    pthread_rwlock_rdlock(&_rwLock);
    
    sleep(2.);
    [super read];
    
    pthread_rwlock_unlock(&_rwLock);
}

- (void)write {
    pthread_rwlock_wrlock(&_rwLock);
    
    sleep(2.f);
    [super write];
    
    pthread_rwlock_unlock(&_rwLock);
}

@end
