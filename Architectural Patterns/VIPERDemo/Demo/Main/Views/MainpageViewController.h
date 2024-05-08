//
//  MainpageViewController.h
//  Demo
//
//  Created by  on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItem;
@class MainpagePresenter;
@interface MainpageViewController : UIViewController

@property (nonatomic, strong) MainpagePresenter *presenter;

- (void)displayTodoItems:(NSArray<TodoItem *> *)items;

@end


NS_ASSUME_NONNULL_END
