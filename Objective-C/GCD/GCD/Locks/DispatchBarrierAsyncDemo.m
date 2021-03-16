//
//  DispatchBarrierAsyncDemo.m
//  GCD
//
//  Created by kkk on 2019/10/20.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "DispatchBarrierAsyncDemo.h"

@interface DispatchBarrierAsyncDemo ()

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation DispatchBarrierAsyncDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        //队列必须是自己创建的并发队列，不能够使用全局并发队列或串行队列(等同于dispatch_async)
        self.queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
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
    dispatch_async(self.queue, ^{
        sleep(2.);
        [super read];
    });
}

- (void)write {
    dispatch_barrier_async(self.queue, ^{
        sleep(2.f);
        [super write];
    });
}

@end
