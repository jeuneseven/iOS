//
//  main.m
//  BlockCopy
//
//  Created by kkk on 2019/9/23.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

typedef void(^ReturnBlock) (void);
//ARC模式下，block作为返回值时，会被自动的copy
//ReturnBlock block() {
//    NSInteger i = 10;
//    return ^{
//        NSLog(@"i == %ld", i);
//    };
//}

typedef void (^Block) (void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        ReturnBlock returnBlock = block();
//        returnBlock();
//        NSLog(@"[returnBlock class] == %@", [returnBlock class]);
//
//        NSInteger intValue = 1;
//        ReturnBlock weakBlock = ^{
//            NSLog(@"intValue == %ld", intValue);
//        };
        //block被强指针指向时，也会被自动copy，变为__NSMallocBlock__
        //MRC的情况下为__NSStackBlock__
//        NSLog(@"[weakBlock class] == %@", [weakBlock class]);
        
        NSArray *array = @[];
        //cocoa的api中使用UsingBlock的，也会被自动的copy
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"");
        }];
        //GCD中的block也会被自动copy
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSLog(@"");
        });
        
        Block block;
        {
            SomeClass *object = [[SomeClass alloc] init];
            object.intValue = 11;
            //stack上的block访问auto变量时，不会发生强引用
            block = ^{
                NSLog(@"object.intValue == %ld", object.intValue);
            };
        }
        //在ARC环境下，到此位置，block未释放，SomeClass的dealloc不会被调用，因为block对于SomeClass有强引用
        //在MRC环境下，block为stack类型，到此位置SomeClass已经释放，只有对block进行copy操作，才能够对于SomeClass有一份拷贝到堆空间上
//        Block block;
//        {
//            SomeClass *object = [[SomeClass alloc] init];
//            object.intValue = 11;
//
//            block = [^{
//                NSLog(@"object.intValue == %ld", object.intValue);
//            } copy];
//
//            [object release];
//        }
        NSLog(@"%s %d", __func__, __LINE__);
        
        //当block访问的外部变量是对象类型时，Desc中就会生成copy和dispose
        Block weakBlock;
        {
            SomeClass *object = [[SomeClass alloc] init];
            object.intValue = 11;
            __weak SomeClass *weakObject = object;
            //堆上的block会根据外部变量的修饰符来决定是否对外部变量进行强引用
            //ARC环境下，block会被copy，当调用copy的时候，copy函数内部会调用_Block_object_assign函数，_Block_object_assign函数会根据外部auto变量的修饰符（__strong,__weak,__unsafe_unretained对于传入的变量进行相关操作，类似retain（从而形成强引用或弱引用））
            weakBlock = ^{
                NSLog(@"weakObject.intValue == %ld", weakObject.intValue);
            };
        }
        //在此行执行前，SomeClass已经被释放
        NSLog(@"%s %d", __func__, __LINE__);
    }
    //block被释放时，内部会调用_Block_object_dispose函数，它会根据auto变量的修饰符来进行release
    //struct __main_block_desc_3* Desc 中的 copy（内部有_Block_object_assign函数），dispose（内部有_Block_object_dispose函数）
    return 0;
}
