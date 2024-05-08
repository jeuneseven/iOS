//
//  TodoItemDetailPresenter.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItemDetailViewController;
@class TodoItem;
@class TodoItemDetailInteractor;
@class TodoItemDetailPresenter;
@protocol TodoItemDetailPresenterDelegate <NSObject>
- (void)todoItemDetailPresenterDidUpdateItem:(TodoItemDetailPresenter *)presenter todoItem:(TodoItem *)todoItem edit:(BOOL)isEdit;
@end
@interface TodoItemDetailPresenter : NSObject

@property (nonatomic, strong) TodoItemDetailViewController *view;
@property (nonatomic, strong) TodoItemDetailInteractor *interactor;
@property (nonatomic, strong) TodoItem *currentItem;
@property (nonatomic, weak) id<TodoItemDetailPresenterDelegate> delegate;

- (void)saveItemWithTitle:(NSString *)title;
- (void)loadItem;

@end

NS_ASSUME_NONNULL_END
