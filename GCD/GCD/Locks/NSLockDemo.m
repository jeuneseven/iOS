//
//  NSLockDemo.m
//  GCD
//
//  Created by kkk on 2019/10/16.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
//NSLock是对pthread_mutex的面向对象封装
@property (nonatomic, strong) NSLock *ticketLock;

@property (nonatomic, strong) NSLock *moneyLock;

@end

@implementation NSLockDemo


- (instancetype)init {
    self = [super init];
    if (self) {
        self.ticketLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
    }
    
    return self;
}

- (void)drawMoney
{
    [self.moneyLock lock];
    
    [super drawMoney];
    
    [self.moneyLock unlock];
}

- (void)saveMoney
{
    [self.moneyLock lock];
    
    [super saveMoney];
    
    [self.moneyLock unlock];
}

- (void)saleTicket
{
    [self.ticketLock lock];
    
    [super saleTicket];
    
    [self.ticketLock unlock];
}

@end
