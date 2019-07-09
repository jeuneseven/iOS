//
//  SomeClass.h
//  KVO
//
//  Created by kkk on 2019/7/1.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OtherClass : NSObject

@property (nonatomic, assign) NSInteger intValue;

@end

@interface SomeClass : NSObject

@property (nonatomic, assign) NSInteger intValue;
@property (nonatomic, strong) OtherClass *otherObject;

@end

NS_ASSUME_NONNULL_END
