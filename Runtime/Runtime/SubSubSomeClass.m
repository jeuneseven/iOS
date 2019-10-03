//
//  SubSubSomeClass.m
//  Runtime
//
//  Created by kkk on 2019/10/3.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSubSomeClass.h"

@implementation SubSubSomeClass

- (void)subSubSomeMethod {
    NSLog(@"%s", __func__);
}

- (void)instanceMethod {
    NSLog(@"%s", __func__);
}

+ (void)classMethod {
    NSLog(@"%s", __func__);
}

@end
