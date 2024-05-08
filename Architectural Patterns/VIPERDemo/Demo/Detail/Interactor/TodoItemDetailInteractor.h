//
//  TodoItemDetailInteractor.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItem;
@interface TodoItemDetailInteractor : NSObject

@property (nonatomic, strong) TodoItem *currentItem;

- (instancetype)initWithItem:(TodoItem * _Nullable)item;
- (void)updateItemWithTitle:(NSString *)title;
- (void)createItemWithTitle:(NSString *)title;
- (TodoItem *)getCurrentItem;

@end

NS_ASSUME_NONNULL_END
