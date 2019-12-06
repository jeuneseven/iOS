//
//  SubProxy.h
//  NSProxy
//
//  Created by kkk on 2019/12/6.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 使用 NSProxy 子类转发效率更高，直接进行消息转发，无需进行objc_msgSend的三大步骤（发送消息、动态解析、消息转发）
 */
@interface SubProxy : NSProxy

@property (nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
