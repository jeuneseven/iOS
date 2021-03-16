//
//  SomeObserver.m
//  KVC
//
//  Created by kkk on 2019/9/2.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeObserver.h"

@implementation SomeObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%s change == %@", __func__, change);
}

@end
