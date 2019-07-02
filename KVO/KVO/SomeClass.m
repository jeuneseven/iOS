//
//  SomeClass.m
//  KVO
//
//  Created by 李占昆 on 2019/7/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

- (void)setIntValue:(int)intValue {
    _intValue = intValue;
    
    NSLog(@"%s", __func__);
}

- (void)willChangeValueForKey:(NSString *)key {
    [super willChangeValueForKey:key];
    
    NSLog(@"%s", __func__);
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"begin %s", __func__);
    
    [super didChangeValueForKey:key];

    NSLog(@"end %s", __func__);
}

@end
