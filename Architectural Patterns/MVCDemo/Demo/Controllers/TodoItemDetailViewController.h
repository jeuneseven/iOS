//
//  AddViewController.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemDetailViewController.h"
#import "TodoItem.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TodoItemDetailViewControllerDelegate

- (void)createTodo:(NSString *)todo;
- (void)updateTodo: (NSString *)todo atRow:(NSUInteger)row;
- (void)didCancelCreatingNewTodo;

@end

@interface TodoItemDetailViewController : UIViewController

@property (weak, nonatomic) id <TodoItemDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) TodoItem *todo;
@property (assign, nonatomic) NSUInteger row;

- (instancetype)initWithTodo:(TodoItem *)todo atRow:(NSUInteger)row;

@end

NS_ASSUME_NONNULL_END
