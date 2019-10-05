//
//  main.m
//  RuntimeSuperClass
//
//  Created by kkk on 2019/10/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubSomeClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SubSomeClass *subSomeObject = [[SubSomeClass alloc] init];
        NSLog(@"%s", __func__);
    }
    return 0;
}
