//
//  DispatchSemaphoreDemo.m
//  GCD
//
//  Created by kkk on 2019/10/18.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "DispatchSemaphoreDemo.h"

@interface DispatchSemaphoreDemo ()
//信号量，可以控制线程最大并发数量，类似技术还有 NSOperationQueue 中的 maxConcurrentOperationCount
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
//由于信号量可以控制最大线程最大并发数量，所以也可以用来作为线程同步的技术方案
@property (nonatomic, strong) dispatch_semaphore_t ticketSemaphore;
@property (nonatomic, strong) dispatch_semaphore_t moneySemaphore;

@end

@implementation DispatchSemaphoreDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(5);
        
        self.ticketSemaphore = dispatch_semaphore_create(1);
        self.moneySemaphore = dispatch_semaphore_create(1);
    }
    
    return self;
}

- (void)log {
    for (NSInteger i = 0; i < 10; i++) {
        [NSThread detachNewThreadSelector:@selector(function) toTarget:self withObject:nil];
    }
}

- (void)function {
    //如果信号量值 > 0，那么信号量 - 1 然后继续执行后续代码
    //如果信号量 <= 0，那么就会等待，直到信号量 > 0，然后信号量 - 1 然后继续执行后续代码
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(2);
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    //让信号量 + 1
    dispatch_semaphore_signal(self.semaphore);
}

- (void)drawMoney
{
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
        [super drawMoney];
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)saveMoney
{
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
        [super saveMoney];
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)saleTicket
{
    dispatch_semaphore_wait(self.ticketSemaphore, DISPATCH_TIME_FOREVER);
        [super saleTicket];
    dispatch_semaphore_signal(self.ticketSemaphore);
}

@end
