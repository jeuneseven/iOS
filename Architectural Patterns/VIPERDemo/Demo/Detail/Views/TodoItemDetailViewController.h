//
//  TodoItemDetailViewController.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TodoItem;
@class TodoItemDetailPresenter;
@interface TodoItemDetailViewController : UIViewController

@property (nonatomic, strong) TodoItemDetailPresenter *presenter;
@property (nonatomic, strong) UITextField *titleTextField;

- (void)configureWithItem:(TodoItem *)item;

@end

NS_ASSUME_NONNULL_END
