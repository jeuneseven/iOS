//
//  NSObject+Category.m
//  Object
//
//  Created by 李占昆 on 2019/6/21.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

- (void)classMethod {
    NSLog(@"%s %p", __func__, self);
}

+ (void)classMethod {
    NSLog(@"%s %p", __func__, self);
}

@end
