//
//  BaseNoLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/11.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "BaseNoLockDemo.h"

@interface BaseNoLockDemo ()

@property (nonatomic, assign) NSInteger ticketsCount;
@property (nonatomic, assign) NSInteger money;

@end

@implementation BaseNoLockDemo

- (void)log {
    
}

- (void)moneyTest {
    self.money = 1000;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self drawMoney];
        }
    });
}

- (void)saveMoney {
    NSInteger oldMoney = self.money;
    sleep(.2);
    oldMoney += 100;
    self.money = oldMoney;
    NSLog(@"存100元 还剩%ld元 %@", oldMoney, [NSThread currentThread]);
}

- (void)drawMoney {
    NSInteger oldMoney = self.money;
    sleep(.2);
    oldMoney -= 100;
    self.money = oldMoney;
    NSLog(@"取100元 还剩%ld元 %@", oldMoney, [NSThread currentThread]);
}

- (void)saleTicket {
    NSInteger oldTicketCount = self.ticketsCount;
    sleep(.2);
    oldTicketCount--;
    self.ticketsCount = oldTicketCount;
    
    NSLog(@"还剩%ld张票 %@", oldTicketCount, [NSThread currentThread]);
}

- (void)saleTickets {
    self.ticketsCount = 10;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            [self saleTicket];
        }
    });
}

@end
