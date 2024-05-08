//
//  TodoItemDetailInteractor.m
//  Demo
//
//  Created by on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemDetailInteractor.h"
#import "TodoItem.h"

@implementation TodoItemDetailInteractor

- (instancetype)initWithItem:(TodoItem * _Nullable)item {
    self = [super init];
    if (self) {
        _currentItem = item ? item : [[TodoItem alloc] init]; // Create a new item if none is provided
    }
    return self;
}

- (void)updateItemWithTitle:(NSString *)title {
    if (title != nil && self.currentItem) {
        self.currentItem.title = title;
    }
}

- (void)createItemWithTitle:(NSString *)title {
    self.currentItem = [[TodoItem alloc] init];
    self.currentItem.title = title;
}

- (TodoItem *)getCurrentItem {
    return self.currentItem;
}

@end
