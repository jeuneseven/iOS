//
//  TodoItemDetailPresenter.m
//  Demo
//
//  Created by on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemDetailPresenter.h"
#import "TodoItemDetailViewController.h"
#import "TodoItemDetailInteractor.h"
#import "TodoItem.h"

@implementation TodoItemDetailPresenter

- (void)loadItem {
    // If there is an item, configure the view with it
    if (self.currentItem) {
        [self.view configureWithItem:self.currentItem];
    } else {
        // Otherwise, configure the view for a new item
        [self.view configureWithItem:nil];
    }
}

- (void)saveItemWithTitle:(NSString *)title {
    if (self.currentItem) {
        // If an item exists, update it
        [self.interactor updateItemWithTitle:title];
        [self.delegate todoItemDetailPresenterDidUpdateItem:self todoItem:self.currentItem edit:YES];
    } else {
        // Otherwise, create a new item
        [self.interactor createItemWithTitle:title];
        [self.delegate todoItemDetailPresenterDidUpdateItem:self todoItem:self.interactor.currentItem edit:NO];
    }
    
    // Optionally navigate back or dismiss the view
    [self.view.navigationController popViewControllerAnimated:YES];
}

@end
