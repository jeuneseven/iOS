//
//  SubSomeClass.m
//  Category
//
//  Created by 李占昆 on 2019/9/15.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSomeClass.h"

@implementation SubSomeClass
//load方法是runtime一次性调用的，不管是否导入该类，只要参与编译就会调用
//+ (void)load {
//    NSLog(@"%s", __func__);
//}
//如果子类没有实现initialize，将会调用父类的initialize，那么父类的initialize可能会调用多次，但调用多次不代表父类被初始化了多次
//+ (void)initialize {
//    NSLog(@"%s", __func__);
//}

@end
