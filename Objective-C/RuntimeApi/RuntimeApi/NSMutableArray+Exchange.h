//
//  NSMutableArray+Exchange.h
//  RuntimeApi
//
//  Created by kkk on 2019/10/7.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Exchange)
- (void)ex_insertObject:(id)object atIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
