//
//  SomeClass+OtherCategory.m
//  Category
//
//  Created by kkk on 2019/9/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass+OtherCategory.h"
#import <objc/runtime.h>

@implementation SomeClass (OtherCategory)
//通过const声明的变量可以在外部使用extern来进行访问和修改，存在风险，应该加上static
static const void *kIntegerValueKey = &kIntegerValueKey;
//定义char类型的变量，取地址，只占一个字节
static const char kStringValueKey;

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)initialize {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    //SomeClass在销毁时会自动销毁关联对象，无需再dealloc中移除
}
/**
 void
 objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key,
 id _Nullable value, objc_AssociationPolicy policy)
 内部结构为：
 AssociationsManager（内有一个static AssociationsHashMap *_map;）
 AssociationsHashMap是一个类似字典的结构，key为disguised_ptr_t（即为传入的id _Nonnull object，DISGUISE(object)内部对传入的对象进行位运算作为key），value为 ObjectAssociationMap *
 ObjectAssociationMap也是一个字典，key为void *（即为传入的const void * _Nonnull key）, value为 ObjcAssociation
 ObjcAssociation中存放uintptr_t _policy 和 id _value;
 */
- (void)setIntegerValue:(NSInteger)integerValue {
    objc_setAssociatedObject(self, kIntegerValueKey, @(integerValue), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)integerValue {
    return [objc_getAssociatedObject(self, kIntegerValueKey) integerValue];
}
//关联对象并非存储在当前对象的内存中，而是存储在一个全局统一的AssociationsManager（AssociationsHashMap字典）中
- (void)setStringValue:(NSString *)stringValue {
    objc_setAssociatedObject(self, &kStringValueKey, stringValue, OBJC_ASSOCIATION_COPY);
}

- (NSString *)stringValue {
    return objc_getAssociatedObject(self, &kStringValueKey);
}
//如果想移除关联对象，设置为nil即可
//如果想移除所有的关联对象，调用objc_removeAssociatedObjects(<#id  _Nonnull object#>)即可
//使用@selector(string)作为key更为直观
- (void)setString:(NSString *)string {
    objc_setAssociatedObject(self, @selector(string), string, OBJC_ASSOCIATION_COPY);
}

- (NSString *)string {
    //key或写成_cmd，代表当前方法的@selector
    return objc_getAssociatedObject(self, @selector(string));
}

- (void)categoryMethod {
    NSLog(@"%s", __func__);
}

@end
