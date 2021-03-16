//
//  SomeClass+Category.h
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

NS_ASSUME_NONNULL_BEGIN
/**
 objc源码中的 objc-runtime-new.mm 类的 static void
 attachCategories(Class cls, category_list *cats, bool flush_caches) 函数最终实现运行时将category合并至类中
 
 runtime中的category结构：
 struct category_t {
 const char *name;
 classref_t cls;
 struct method_list_t *instanceMethods;
 struct method_list_t *classMethods;
 struct protocol_list_t *protocols;
 struct property_list_t *instanceProperties;
 // Fields below this point are not always present on disk.
 struct property_list_t *_classProperties;
 
 method_list_t *methodsForMeta(bool isMeta) {
 if (isMeta) return classMethods;
 else return instanceMethods;
 }
 
 property_list_t *propertiesForMeta(bool isMeta, struct header_info *hi);
 };
 */

@interface SomeClass (Category) <NSCoding, NSCopying>

- (void)categoryMethod; 

@property (nonatomic, assign) NSInteger intValue;

@end

NS_ASSUME_NONNULL_END
