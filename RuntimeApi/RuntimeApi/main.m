//
//  main.m
//  RuntimeApi
//
//  Created by kkk on 2019/10/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "SomeClass.h"
#import "OtherClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *someObject = [[SomeClass alloc] init];
        [someObject instanceMethod];
        //设置对象的类，设置isa指向的类
        object_setClass(someObject, [OtherClass class]);
        [someObject instanceMethod];
    }
    return 0;
}
