//
//  TodoItemManager.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItem;
@interface TodoItemManager : NSObject

// Singleton instance
+ (instancetype)sharedManager;

// Fetch all todo items
- (NSArray<TodoItem *> *)fetchAllTodos;

// Fetch filtered todo items
- (NSArray<TodoItem *> *)fetchFilteredTodos;

// Add a new todo item
- (void)addTodo:(TodoItem *)todoItem;

// Update an existing todo item
- (void)updateTodo:(TodoItem *)todoItem;

// Delete a todo item
- (void)deleteTodo:(TodoItem *)todoItem;

// Search todo items by title
- (void)searchTodosByTitle:(NSString *)title;

- (BOOL)todoItemExists:(TodoItem *)todoItem;

@end


NS_ASSUME_NONNULL_END
