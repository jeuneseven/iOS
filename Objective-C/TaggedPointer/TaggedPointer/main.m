//
//  main.m
//  TaggedPointer
//
//  Created by kkk on 2019/11/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger e = 4;
NSInteger f;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"1";
        
        NSInteger a = 2;
        NSInteger b;
        
        static NSInteger c = 3;
        static NSInteger d;
        
        NSObject *object = [[NSObject alloc] init];
        /**
         iOS中的内存布局（由低到高）
         1.保留区：一般不使用
         2.代码区：代码编译后存放的区域
         3.数据段：常量、已初始化的全局变量、已初始化的静态变量、未初始化的全局变量、未初始化的静态变量
         4.堆：alloc、malloc、calloc出的变量，分配的地址越来越大
         5.栈：函数调用开销、局部变量，分配的地址越来越小
         */
        NSLog(@"string == %p\n", string);
        NSLog(@"&a == %p\n", &a);
        NSLog(@"&b == %p\n", &b);
        NSLog(@"&c == %p\n", &c);
        NSLog(@"&d == %p\n", &d);
        NSLog(@"&e == %p\n", &e);
        NSLog(@"&f == %p\n", &f);
        NSLog(@"object == %p\n", object);
        
        /**
         从64位开始，iOS引入了tagged pointer技术，用于NSNumber、NSDate、NSString等小对象的存储，节省内存空间
         在没有使用Tagged Pointer之前， NSNumber等对象需要动态分配内存、维护引用计数等，NSNumber指针存储的是堆中NSNumber对象的地址值
         使用Tagged Pointer之后，NSNumber指针里面存储的数据变成了：Tag + Data，也就是将数据直接存储在了指针中
         当指针不够存储数据时，才会使用动态分配内存的方式来存储数据
         
         objc_msgSend能识别Tagged Pointer，比如NSNumber的intValue方法，直接从指针提取数据，节省了以前的调用开销；在调用set方法时会直接将指针赋值给对应的对象，而非原来MRC环境下的先release再copy或retain
         判断一个指针是否为Tagged Pointer:如果是对象的话最低位肯定是0，如果最低位不是0则可能是tagged pointer
         iOS平台，最高有效位是1（第64bit）0b1000
         Mac平台，最低有效位是1：0b0001
         */
        NSNumber *number1 = @(1);
        NSNumber *number2 = @(0xfffffffffffff);
        
        NSLog(@"number1 == %p number2 == %p", number1, number2);
        NSLog(@"number1 == %@ number2 == %@", [number1 class], [number2 class]);
    }
    return 0;
}
