//
//  SomeClass+OtherCategory.m
//  Category
//
//  Created by 李占昆 on 2019/9/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass+OtherCategory.h"

@implementation SomeClass (OtherCategory)

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)initialize {
    NSLog(@"%s", __func__);
}

- (void)categoryMethod {
    NSLog(@"%s", __func__);
}

@end
