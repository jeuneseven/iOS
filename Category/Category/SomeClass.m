//
//  SomeClass.m
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"
//扩展是在编译时就添加到类当中的
@interface SomeClass ()

@end

@implementation SomeClass

+ (void)load {
    NSLog(@"%s", __func__);
}

@end
