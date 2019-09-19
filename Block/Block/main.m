//
//  main.m
//  Block
//
//  Created by kkk on 2019/9/19.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;//函数指针
};

struct __main_block_desc_0 {
    size_t reserved;//保留字
    size_t Block_size;//block所占内存大小
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    NSInteger intValue;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger intValue = 10;
        void (^block)(NSInteger a, NSInteger b) = ^(NSInteger a, NSInteger b) {
            NSLog(@"a == %ld, b == %ld, intValue == %ld", a, b, intValue);
        };
        
        //将block强转为结构体，即底层实现
        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
        //函数指针就是上方block的内部执行地址
        NSLog(@"blockStruct->impl.FuncPtr == %p", blockStruct->impl.FuncPtr);
        block(0, 1);
    }
    return 0;
}
