//
//  KVCClass.m
//  KVC
//
//  Created by kkk on 2019/9/2.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "KVCClass.h"

@implementation KVCClass

//- (void)setIntValue:(NSInteger)intValue {
//    NSLog(@"%s", __func__);
//}
//
//- (void)_setIntValue:(NSInteger)intValue {
//    NSLog(@"%s", __func__);
//}

+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

@end
