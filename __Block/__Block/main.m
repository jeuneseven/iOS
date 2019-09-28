//
//  main.m
//  __Block
//
//  Created by kkk on 2019/9/27.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block) (void);

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(void);
    void (*dispose)(void);
};

struct __Block_byref_intValue_0 {
    void *__isa;
    struct __Block_byref_intValue_0 *__forwarding;
    int __flags;
    int __size;
    NSInteger intValue;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    struct __Block_byref_intValue_0 *intValue; // by ref
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //__block不能修饰static和全局变量
//        编译器会将__block 修饰 的auto变量封装为对象
        __block NSInteger intValue = 10;
        //__block修饰变量为对象时，编译器会将该变量封装为带有__Block_byref_id_object_copy、__Block_byref_id_object_dispose等对于对象有引用计数管理的结构体
        __block NSObject *object = [[NSObject alloc] init];
        __weak NSObject *weakObject = object;
        NSInteger integerValue = 11;
        //集合类在block中使用时无需增加__block进行修饰，这是对集合进行使用，而非修改集合
        NSMutableArray *array = [NSMutableArray array];
        //当block在栈上时，__block不会对内部的封装对象进行强引用
        //当block被拷贝到堆上时，block会调用copy函数，copy内部会调用_Block_object_assign，该函数会对内部的封装对象形成强引用(retain)
        Block block = ^{
            //intValue->__forwarding->intValue
            intValue = 11;
            NSLog(@"intValue == %ld", intValue);
            
            NSLog(@"integerValue == %ld", integerValue);
            
            object = nil;
            NSLog(@"object == %@", object);
            
            NSLog(@"weakObject == %@", weakObject);
            
            [array addObject:@"1"];
        };
        
        struct __main_block_impl_0 *blockImp = (__bridge struct __main_block_impl_0 *)block;
        //该地址值是block内部封装intValue为对象的内部的intValue地址值，即intValue->__forwarding->intValue的地址
        NSLog(@"intValue == %p", &intValue);
        /**
         对于对象类型的变量：
         当block在栈上时，对于auto变量不会产生强引用
         当block在堆上时，会通过copy函数来对变量进行retain操作
         当block从堆上移除时，会通过dispose函数对变量进行release操作
         
         __block修饰的变量会始终对于变量产生强引用，而没有该修饰词修饰的变量会根据变量是否由__weak修饰来决定是否对变量进行强引用
         */
        block();
    }
    //当block销毁时，会调用内部的dispose函数，该函数内部会调用_Block_object_dispose，对于block内部的封装对象进行release操作
    return 0;
}
