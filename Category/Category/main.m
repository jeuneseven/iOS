//
//  main.m
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"
#import "SomeClass+Category.h"
#import "SomeClass+OtherCategory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *object = [[SomeClass alloc] init];
        [object categoryMethod];
    }
    return 0;
}
