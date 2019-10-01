//
//  main.m
//  Runtime
//
//  Created by kkk on 2019/10/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *object = [[SomeClass alloc] init];
        object.boolValue = YES;
        object.boolValue = NO;
        NSLog(@"object.boolValue == %d", object.boolValue);
        
        object.boolTypeValue = YES;
        object.boolTypeValue = NO;
        NSLog(@"object.boolTypeValue == %d", object.boolTypeValue);
        
        object.isTall = YES;
        object.isRich = YES;
        object.isHandsome = NO;
        NSLog(@"object.isTall == %d object.isRich == %d object.isHandsome == %d", object.isTall, object.isRich, object.isHandsome);
    }
    return 0;
}
