//
//  OtherClass.m
//  MRC
//
//  Created by kkk on 2019/11/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "OtherClass.h"

@implementation OtherClass

- (void)doSomething {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [super dealloc];
}

@end
