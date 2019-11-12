//
//  SomeClass.m
//  MRC
//
//  Created by kkk on 2019/11/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"
#import "OtherClass.h"

@interface SomeClass () {
    OtherClass *_otherObject;
}

@end

@implementation SomeClass

- (void)setOtherObject:(OtherClass *)otherObject {
    if (_otherObject != otherObject) {
        [_otherObject release];
        _otherObject = [otherObject retain];
    }
}

- (OtherClass *)otherObject {
    return _otherObject;
}

- (void)dealloc {
    //先释放自己的资源，再释放父类资源
    [_otherObject release];
    _otherObject = nil;
    
    NSLog(@"%s", __func__);
    
    [super dealloc];
}

@end
