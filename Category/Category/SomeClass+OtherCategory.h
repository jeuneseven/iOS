//
//  SomeClass+OtherCategory.h
//  Category
//
//  Created by 李占昆 on 2019/9/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

NS_ASSUME_NONNULL_BEGIN
//该分类最后添加，最先编译，所以最先调用该分类的同样方法
@interface SomeClass (OtherCategory)

- (void)categoryMethod;

@end

NS_ASSUME_NONNULL_END
