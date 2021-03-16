//
//  SomeClass.m
//  BlockRetainCycle
//
//  Created by kkk on 2019/9/30.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

- (void)dealloc {
//    [super dealloc];
    NSLog(@"%s", __func__);
}

- (void)retainCycle {
    //MRC环境下，使用__unsafe_unretained来解除block中对于外部对象的强引用，指向的对象销毁时，不会让指针置为nil，如果访问该指针所指向的位置，会发生野指针错误
    __unsafe_unretained typeof(self) weakSelf = self;
    self.block = ^{
        NSLog(@"self.intValue == %ld", weakSelf.intValue);
    };
}

@end
