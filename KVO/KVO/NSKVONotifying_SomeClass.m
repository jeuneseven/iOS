//
//  NSKVONotifying_SomeClass.m
//  KVO
//
//  Created by kkk on 2019/7/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSKVONotifying_SomeClass.h"
//查看runtime.h中的/* Adding Classes */ 部分，动态创建本类
@implementation NSKVONotifying_SomeClass

- (void)setIntValue:(int)intValue {
    //__NSSetIntValueAndNotify();
}
//内部实现
//void __NSSetIntValueAndNotify() {
//    [self willChangeValueForKey:@"intValue"];
//    [super setIntValue:intValue];
//    [self didChangeValueForKey:@"intValue"];
//}

//- (void)didChangeValueForKey:(NSString *)key {
//    [observer observeValueForKeyPath:@"" ofObject:self change:@{} context:nil];
//}

//屏蔽内部实现，隐藏内部实现
- (Class)class {
    return [SomeClass class];
}

- (void)dealloc {
    //做一些收尾工作
}

- (BOOL)_isKVOA {
    return YES;
}

@end
