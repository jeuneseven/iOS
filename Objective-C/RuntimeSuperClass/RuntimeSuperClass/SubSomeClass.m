//
//  SubSomeClass.m
//  RuntimeSuperClass
//
//  Created by kkk on 2019/10/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSomeClass.h"

@implementation SubSomeClass

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"[self class] == %@", [self class]);
        NSLog(@"[self superclass] == %@", [self superclass]);
        
        NSLog(@"[super class] == %@", [super class]);
        NSLog(@"[super superclass] == %@", [super superclass]);
    }
    
    return self;
}

@end
