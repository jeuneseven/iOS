//
//  SomeClass.h
//  MRC
//
//  Created by kkk on 2019/11/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class OtherClass;
@interface SomeClass : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger intValue;
//copy是针对Foundation框架中的类来进行修饰的，所以在修饰属性时不会存在mutableCopy关键词
@property (nonatomic, copy) NSMutableArray *array;

- (void)setOtherObject:(OtherClass *)otherObject;

+ (SomeClass *)someObject;

@end

NS_ASSUME_NONNULL_END
