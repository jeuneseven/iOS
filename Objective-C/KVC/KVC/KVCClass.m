//
//  KVCClass.m
//  KVC
//
//  Created by kkk on 2019/9/2.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "KVCClass.h"

@implementation KVCClass

//- (NSInteger)getIntValue {
//    return 0;
//}

//- (NSInteger)intValue {
//    return 1;
//}

//- (NSInteger)isIntValue {
//    return 2;
//}

//- (NSInteger)_intValue {
//    return 3;
//}

//- (void)setIntValue:(NSInteger)intValue {
//    NSLog(@"%s", __func__);
//}
//
//- (void)_setIntValue:(NSInteger)intValue {
//    NSLog(@"%s", __func__);
//}

//- (void)willChangeValueForKey:(NSString *)key {
//    [super willChangeValueForKey:key];
//    
//    NSLog(@"%s", __func__);
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"begin %s", __func__);
//    
//    [super didChangeValueForKey:key];
//    
//    NSLog(@"end %s", __func__);
//}
//默认返回YES
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

@end
