//
//  SerialQueueDemo.m
//  GCD
//
//  Created by kkk on 2019/10/17.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SerialQueueDemo.h"

@interface SerialQueueDemo ()

@property (nonatomic, strong) dispatch_queue_t ticketQueue;
@property (nonatomic, strong) dispatch_queue_t moneyQueue;

@end

@implementation SerialQueueDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        //使用串行队列也可以取得线程同步的效果，只要实现多条线程不同时读写同一份资源的效果即可，不一定非要使用锁
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (void)drawMoney
{
    dispatch_sync(self.moneyQueue, ^{
        [super drawMoney];
    });
}

- (void)saveMoney
{
    dispatch_sync(self.moneyQueue, ^{
        [super saveMoney];
    });
}

- (void)saleTicket
{
    dispatch_sync(self.ticketQueue, ^{
        [super saleTicket];
    });
}

@end
