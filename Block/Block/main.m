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
//block底层即为封装了函数调用和外部调用环境的OC对象
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    NSInteger intValue;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         
         struct __main_block_impl_0 {
         struct __block_impl impl;
         struct __main_block_desc_0* Desc;
         //构造函数，返回结构体对象
         __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
         impl.isa = &_NSConcreteStackBlock;
         impl.Flags = flags;
         impl.FuncPtr = fp;
         Desc = desc;
         }
         };
         
         fp = __main_block_func_0;
         
         static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
         
         NSLog((NSString *)&__NSConstantStringImpl__var_folders_dr_54m2j8dn3hx8tkg2n8m4yd300000gn_T_main_7f70bd_mi_0, __func__);
         }
         
         desc = __main_block_desc_0_DATA;
         
         static struct __main_block_desc_0 {
         size_t reserved;
         size_t Block_size;
         } __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
         
         struct __main_block_impl_0 {
         struct __block_impl impl;
         struct __main_block_desc_0* Desc;
         NSInteger intValue;
         };
         
         */
        
//        实际：void (*logBlock)(void) = &__main_block_impl_0(
//                                                         __main_block_func_0, &__main_block_desc_0_DATA
//                                                         );
        void (^logBlock)(void) = ^{
            NSLog(@"%s", __func__);
        };
//        实际：logBlock->FuncPtr(logBlock);
//        __block_impl为__main_block_impl_0的第一个成员，即为__main_block_impl_0的地址
//        (logBlock)即为(struct __main_block_impl_0 *__cself)
//        ((void (*)(__block_impl *))((__block_impl *)logBlock)->FuncPtr)((__block_impl *)logBlock);
        logBlock();
        
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
