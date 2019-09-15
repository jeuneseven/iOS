//
//  SomeClass+Category.m
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass+Category.h"

/**
 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc SomeClass+Category.m
 编译后分类底层结构：
 struct _category_t {
 const char *name;//类名(当前为SomeClass)
 struct _class_t *cls;
 const struct _method_list_t *instance_methods;//对象方法列表
 const struct _method_list_t *class_methods;//类方法列表
 const struct _protocol_list_t *protocols;//协议列表
 const struct _prop_list_t *properties;//属性列表
 };
 */

/**
 static struct _category_t _OBJC_$_CATEGORY_SomeClass_$_Category __attribute__ ((used, section ("__DATA,__objc_const"))) =
 {
 "SomeClass",
 0, // &OBJC_CLASS_$_SomeClass,
 (const struct _method_list_t *)&_OBJC_$_CATEGORY_INSTANCE_METHODS_SomeClass_$_Category,
 (const struct _method_list_t *)&_OBJC_$_CATEGORY_CLASS_METHODS_SomeClass_$_Category,
 (const struct _protocol_list_t *)&_OBJC_CATEGORY_PROTOCOLS_$_SomeClass_$_Category,
 (const struct _prop_list_t *)&_OBJC_$_PROP_LIST_SomeClass_$_Category,
 };
 */
@implementation SomeClass (Category)

+ (void)load {
    NSLog(@"%s", __func__);
}

- (void)categoryMethod {
    NSLog(@"%s", __func__);
}

+ (void)categoryClassMethod {
    NSLog(@"%s", __func__);
}

@end
