//
//  SomeClass+Category.h
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SomeClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SomeClass (Category) <NSCoding, NSCopying>

- (void)categoryMethod;

@property (nonatomic, assign) NSInteger intValue;

@end

NS_ASSUME_NONNULL_END
