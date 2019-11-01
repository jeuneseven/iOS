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
         */
        
        NSNumber *number1 = @1;
        NSNumber *number2 = @(0xfffffffffffff);
        
        NSLog(@"number1 == %p number2 == %p", number1, number2);
    }
    return 0;
}
