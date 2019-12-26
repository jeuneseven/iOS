//
//  SomeClass.m
//  Autorelease
//
//  Created by kkk on 2019/12/26.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

- (void)dealloc {
    [super dealloc];
    
    NSLog(@"%s", __func__);
}

@end
