//
//  MainpagePresenter.m
//  Demo
//
//  Created by on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "MainpagePresenter.h"

@implementation MainpagePresenter

- (void)updateView {
    NSArray *items = [self.interactor getAllItems];
    [self.view displayTodoItems:items];
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    self.selectedIndex = index;
    TodoItem *item = [self.interactor itemAtIndex:index];
    [MainpageRouter presentDetailPageInView:self.view withItem:item];
}

- (void)didRemoveItemAtIndex:(NSInteger)index {
    [self.interactor removeItemAtIndex:index];
    [self updateView];
}

- (void)searchItemsWithQuery:(NSString *)query {
    NSArray *filteredItems = [self.interactor itemsMatchingQuery:query];
    [self.view displayTodoItems:filteredItems];
}

- (NSArray<TodoItem *> *)getAllItems {
    return [self.interactor getAllItems];
}

- (void)addNewItem {
    [MainpageRouter presentDetailPageInView:self.view withItem:nil];
}

@end
