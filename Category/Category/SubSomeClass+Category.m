//
//  SubSomeClass+Category.m
//  Category
//
//  Created by 李占昆 on 2019/9/15.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSomeClass+Category.h"

@implementation SubSomeClass (Category)
//分类的load方法调用顺序只和分类的编译顺序相关，先编译的先调用该分类的load方法
//+ (void)load {
//    NSLog(@"%s", __func__);
//}

//+ (void)initialize {
//    NSLog(@"%s", __func__);
//}

@end
