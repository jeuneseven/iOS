//
//  SomeClass.m
//  KVO
//
//  Created by kkk on 2019/7/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

@implementation OtherClass

@end

@implementation SomeClass

- (void)setIntValue:(NSInteger)intValue {
    _intValue = intValue;
    NSLog(@"%s", __FUNCTION__);
}

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"%s begin", __FUNCTION__);
    [super willChangeValueForKey:key];
    NSLog(@"%s end", __FUNCTION__);
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"%s begin", __FUNCTION__);
    [super didChangeValueForKey:key];
    NSLog(@"%s end", __FUNCTION__);
}

@end
