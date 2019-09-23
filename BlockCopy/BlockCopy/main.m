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
        
        SomeClass *object = [[SomeClass alloc] init];
        object.intValue = 11;
        
        Block block = ^{
            NSLog(@"object.intValue == %ld", object.intValue);
        };
        
        block();
    }
    return 0;
}
