//
//  MainpageInteractor.h
//  Demo
//
//  Created by  on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItem;
@interface MainpageInteractor : NSObject

- (NSArray<TodoItem *> *)getAllItems;
- (TodoItem *)itemAtIndex:(NSInteger)index;
- (void)removeItemAtIndex:(NSInteger)index;
- (void)addItem:(TodoItem *)item;
- (void)updateItemAtIndex:(NSInteger)index withItem:(TodoItem *)item;
- (NSArray<TodoItem *> *)itemsMatchingQuery:(NSString *)query;
- (void)resetFilteredItems;

@end

NS_ASSUME_NONNULL_END
