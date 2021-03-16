//
//  ControlledThread.h
//  Runloop
//
//  Created by kkk on 2019/10/28.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ControlledThreadTask)(void);

NS_ASSUME_NONNULL_BEGIN
//可控线程，生命周期由本类来控制
@interface ControlledThread : NSObject

- (void)start;
- (void)executeTask:(ControlledThreadTask)task;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
