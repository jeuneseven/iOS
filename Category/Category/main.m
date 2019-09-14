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
//编译器参数 -Objc 可以在编译时让编译器知道有分类的数据需要引入
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *object = [[SomeClass alloc] init];
        [object categoryMethod];
    }
    return 0;
}
