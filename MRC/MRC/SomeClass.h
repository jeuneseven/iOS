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
@interface SomeClass : NSObject

@property (nonatomic, assign) NSInteger intValue;

- (void)setOtherObject:(OtherClass *)otherObject;

+ (SomeClass *)someObject;

@end

NS_ASSUME_NONNULL_END
