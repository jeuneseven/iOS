//
//  SomeClass.h
//  BlockRetainCycle
//
//  Created by kkk on 2019/9/30.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^Block) (void);

@interface SomeClass : NSObject
//在MRC环境下，block的修饰词必须是copy，如果不为copy的话，block就会在栈上，copy后会在堆上，在ARC环境下可以为strong
@property (nonatomic, copy) Block block;
@property (nonatomic, assign) NSInteger intValue;

- (void)retainCycle;

@end

NS_ASSUME_NONNULL_END
