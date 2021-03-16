//
//  SomeClass.h
//  RuntimeApi
//
//  Created by kkk on 2019/10/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SomeClass : NSObject {
    NSInteger intValue;
    NSString *stringValue;
}

- (void)instanceMethod;
- (void)otherInstanceMethod;

@end

NS_ASSUME_NONNULL_END
