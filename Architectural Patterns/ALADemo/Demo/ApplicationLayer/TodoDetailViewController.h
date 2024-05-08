//
//  TodoDetailViewController.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItem;
@interface TodoDetailViewController : UIViewController

@property (strong, nonatomic) TodoItem *todoItem;           // Property to hold the incoming TodoItem.
@property (nonatomic, copy) void (^onSave)(void);  // Add a callback property

@end

NS_ASSUME_NONNULL_END
