//
//  SomeClass.m
//  Block
//
//  Created by kkk on 2019/9/22.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

//void blockSelf(SomeClass *self, SEL _cmd);
- (void)blockSelf {
    //self为局部变量，会被捕获到block中，访问属性时会捕获self，然后通过self访问属性
    void(^block)(void) = ^{
        NSLog(@"%p %@", self, self->_someString);
    };
    
    block();
}

@end
