//
//  TodoItemManager.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemManager.h"
#import "TodoItem.h"

@interface TodoItemManager ()

@property (strong, nonatomic) NSMutableArray<TodoItem *> *todoItems;
@property (strong, nonatomic) NSMutableArray<TodoItem *> *filteredItems;
@property (nonatomic, strong) NSString *currentSearchText;

@end

@implementation TodoItemManager

+ (instancetype)sharedManager {
    static TodoItemManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _todoItems = [NSMutableArray array];
        _filteredItems = [NSMutableArray array];
        _currentSearchText = @"";
    }
    return self;
}

- (NSArray<TodoItem *> *)fetchAllTodos {
    return [self.todoItems copy];
}

- (NSArray<TodoItem *> *)fetchFilteredTodos {
    return [self.filteredItems copy];
}

- (void)addTodo:(TodoItem *)todoItem {
    if (todoItem == nil || todoItem.text == nil || [todoItem.text isEqualToString:@""]) {
        NSLog(@"Attempted to add an invalid TodoItem.");
        return;
    }

    [self.todoItems addObject:todoItem];
    [self updateFilteredTodos];
    NSLog(@"TodoItem added: %@", todoItem.text);
}

- (void)updateTodo:(TodoItem *)todoItem {
    NSUInteger index = [self.todoItems indexOfObjectPassingTest:^BOOL(TodoItem *obj, NSUInteger idx, BOOL *stop) {
        return [obj.text isEqualToString:todoItem.text];
    }];
    if (index != NSNotFound) {
        self.todoItems[index] = todoItem;
        [self updateFilteredTodos];
        NSLog(@"TodoItem updated: %@", todoItem.text);
    }
}


- (void)updateFilteredTodos {
    if (self.currentSearchText && ![self.currentSearchText isEqualToString:@""]) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"text CONTAINS[cd] %@", self.currentSearchText];
        self.filteredItems = [self.todoItems filteredArrayUsingPredicate:predicate].mutableCopy;
    } else {
        self.filteredItems = [self.todoItems mutableCopy];
    }
}

- (BOOL)todoItemExists:(TodoItem *)todoItem {
    for (TodoItem *item in self.todoItems) {
        if ([item.text isEqualToString:todoItem.text]) {
            return YES;
        }
    }
    return NO;
}

- (void)deleteTodo:(TodoItem *)todoItem {
    [self.todoItems removeObject:todoItem];
    // Optionally update the filtered list
    [self.filteredItems removeObject:todoItem];
}

- (void)searchTodosByTitle:(NSString *)title {
    self.currentSearchText = title;  
    [self updateFilteredTodos];
}

@end
