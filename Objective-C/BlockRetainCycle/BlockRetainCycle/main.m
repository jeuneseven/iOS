//
//  main.m
//  BlockRetainCycle
//
//  Created by kkk on 2019/9/29.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //使用__block修饰对象也可以解决循环引用问题
        __block SomeClass *blockObject = [[SomeClass alloc] init];
        blockObject.intValue = 10;
        blockObject.block = ^{
            NSLog(@"blockObject.intValue == %ld", blockObject.intValue);
            //必须在block中对于外部引用的对象进行置空
            blockObject = nil;
        };
        //必须调用block
        blockObject.block();
        
        SomeClass *object = [[SomeClass alloc] init];
        object.intValue = 1;
        object.block = ^{
            NSLog(@"object.intValue == %ld", object.intValue);
        };

        //以下两种情况都会造成循环引用，因为对象持有block，并且block中会持有对象
        object.block();
        [object retainCycle];
        //使用__weak来解除block中的SomeClass对象对于外部的强引用，指向的对象销毁时，会自动让指针置为nil
        //MRC环境下不支持__weak
//        __weak SomeClass *weakObject = object; 与下方等价，下方写法更为通用
        __weak typeof(object) weakObject = object;
        object.block = ^{
            NSLog(@"object.intValue == %ld", weakObject.intValue);
        };
        //用于MRC环境下
//        [object retainCycle];
//        [object release];
    }
    NSLog(@"%s", __func__);
    return 0;
}
