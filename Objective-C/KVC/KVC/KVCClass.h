//
//  KVCClass.h
//  KVC
//
//  Created by kkk on 2019/9/2.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVCClass : NSObject {
    @public
    NSInteger intValue;
    NSInteger isIntValue;
    NSInteger _intValue;
    NSInteger _isIntValue;
}

//@property (nonatomic, assign) NSInteger intValue;

@end

NS_ASSUME_NONNULL_END
