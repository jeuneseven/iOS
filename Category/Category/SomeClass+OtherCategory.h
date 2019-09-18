//
//  SomeClass+OtherCategory.h
//  Category
//
//  Created by kkk on 2019/9/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

NS_ASSUME_NONNULL_BEGIN
//该分类最后添加，最先编译，所以最先调用该分类的同样方法
@interface SomeClass (OtherCategory)
//分类如果声明变量，将只会生成set、get方法的声明，不会生成成员变量和方法的实现，并且分类是不能添加成员变量的
@property (nonatomic, assign) NSInteger integerValue;
@property (nonatomic, copy) NSString *stringValue;
@property (nonatomic, copy) NSString *string;

- (void)categoryMethod;

@end

NS_ASSUME_NONNULL_END
