//
//  NSMutableArray+Exchange.m
//  RuntimeApi
//
//  Created by kkk on 2019/10/7.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "NSMutableArray+Exchange.h"
#import <objc/runtime.h>
#import <AppKit/AppKit.h>


@implementation NSMutableArray (Exchange)

+ (void)load {
    //交换方法时要找到真实的类
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method exchangeMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(ex_insertObject:atIndex:));
    //方法交换实际交换的是method_t中的imp，只要调用该方法就会清空缓存
    method_exchangeImplementations(originMethod, exchangeMethod);
}

- (void)ex_insertObject:(id)object atIndex:(NSInteger)index {
    NSLog(@"object == %@", object);
    //调用系统原来的实现
    [self ex_insertObject:object atIndex:index];
}

@end
