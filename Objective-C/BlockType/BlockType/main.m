//
//  main.m
//  BlockType
//
//  Created by kkk on 2019/9/22.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger globalInt = 11;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        void (^logBlock)(void) = ^{
            NSLog(@"%s", __func__);
        };
        //[logBlock class] == __NSGlobalBlock__ [[logBlock class] superclass] == __NSGlobalBlock [[[logBlock class] superclass] superclass] == NSBlock [[[[logBlock class] superclass] superclass] superclass] == NSObject
        //block本质为OC对象，并继承自NSObject
        NSLog(@"[logBlock class] == %@ [[logBlock class] superclass] == %@ [[[logBlock class] superclass] superclass] == %@ [[[[logBlock class] superclass] superclass] superclass] == %@", [logBlock class],
              [[logBlock class] superclass],
              [[[logBlock class] superclass] superclass],
              [[[[logBlock class] superclass] superclass] superclass]);
        //没有访问auto变量即为NSGlobalBlock
        static NSInteger i = 10;
        void (^globalBlock)(void) = ^{
            NSLog(@"%s", __func__);
            NSLog(@"%ld", i);
            NSLog(@"%ld", globalInt);
        };
        
        NSInteger intValue = 10;
        //访问了auto变量即为NSStackBlock（在ARC模式下为NSMallocBlock）
        //NSStackBlock调用copy会变成NSMallocBlock
        void (^mallocBlock)(void) = ^{
            NSLog(@"intValue == %ld", intValue);
        };
        //全局变量放在数据段，alloc、malloc出来的放在堆中，局部变量放在栈中，内存地址依次增大
        //block分为三种类型：__NSGlobalBlock__ __NSMallocBlock__ __NSStackBlock__
        NSLog(@"%@ %@ %@ %@", [globalBlock class], [mallocBlock class], [[mallocBlock copy] class], [^{
            NSLog(@"intValue == %ld", intValue);
        } class]);
        //__NSGlobalBlock__调用copy什么也不会做
        //__NSStackBlock__调用copy会将block从栈复制到堆上
        //__NSMallocBlock__调用block引用计数器会+1
        NSLog(@"\n[[globalBlock copy] class] == %@\n [[mallocBlock copy] class] == %@\n [[[mallocBlock copy] copy] class] == %@\n", [[globalBlock copy] class], [[mallocBlock copy] class], [[[mallocBlock copy] copy] class]);
    }
    return 0;
}
