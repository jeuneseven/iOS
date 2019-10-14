//
//  BaseNoLockDemo.h
//  GCD
//
//  Created by kkk on 2019/10/11.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNoLockDemo : NSObject

- (void)moneyTest;
- (void)saveMoney;
- (void)drawMoney;

- (void)saleTicket;
- (void)saleTickets;

- (void)log;

@end

NS_ASSUME_NONNULL_END
