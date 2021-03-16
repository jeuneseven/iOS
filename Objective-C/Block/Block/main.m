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

NSInteger globalInt = 123;
static NSInteger globalStaticInt = 456;

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
        //局部变量分为三种，auto、static、register，由于作用域问题，所以需要被block捕获
        //auto 自动变量，离开作用域就自动销毁，不能修饰全局变量，在block中是值传递，由于会自动销毁，所以只能是值传递
        NSInteger intValue = 10;
        //static，在block中是指针传递，在block执行前修改的话会修改block中的捕获变量
        static NSInteger integerValue = 11;
        //register 使用寄存器来存储，在block中是值传递
        register NSInteger integer = 100;
        void (^block)(NSInteger a, NSInteger b) = ^(NSInteger a, NSInteger b) {
            //block在创建时就将变量捕获到内部（capture）
            NSLog(@"a == %ld, b == %ld, intValue == %ld, integerValue == %ld, integer == %ld", a, b, intValue, integerValue, integer);
        };
        
        intValue = 20;
        integerValue = 30;
        integer = 40;
        
        //将block强转为结构体，即底层实现
        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
        //函数指针就是上方block的内部执行地址
        NSLog(@"blockStruct->impl.FuncPtr == %p", blockStruct->impl.FuncPtr);
        block(0, 1);
        //全局变量不会捕获到block中，因为所有函数都可以直接访问
        void (^globalBlock)(void) = ^{
            NSLog(@"globalInt == %ld, globalStaticInt == %ld", globalInt, (long)globalStaticInt);
        };
        
        globalInt = 1234;
        globalStaticInt = 4567;
        
        globalBlock();
    }
    return 0;
}
