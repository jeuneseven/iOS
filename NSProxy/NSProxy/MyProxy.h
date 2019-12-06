//
//  MyProxy.h
//  NSProxy
//
//  Created by kkk on 2019/12/6.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyProxy : NSObject

@property (nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
