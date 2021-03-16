//
//  SomeClass.m
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"
//扩展是在编译时就添加到类当中的
@interface SomeClass ()

@end

@implementation SomeClass

+ (void)classMethod {
    NSLog(@"%s", __func__);
}
//先调用父类的load方法，再调用该类的load方法
+ (void)load {
    NSLog(@"%s", __func__);
}
//initialize方法是通过objc_msgSend调用的，只在类第一次接收到消息时调用
//先调用父类的initialize，再调用子类的initialize
+ (void)initialize {
    NSLog(@"%s", __func__);
}

@end
