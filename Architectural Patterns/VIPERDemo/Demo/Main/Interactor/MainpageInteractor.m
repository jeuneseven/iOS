//
//  MainpageInteractor.m
//  Demo
//
//  Created by on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "MainpageInteractor.h"

@interface MainpageInteractor()

@property (nonatomic, strong) NSMutableArray<TodoItem *> *items; // 主数组，存储所有待办事项
@property (nonatomic, strong) NSMutableArray<TodoItem *> *filteredItems; // 用于搜索的数组

@end

@implementation MainpageInteractor

- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _filteredItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray<TodoItem *> *)getAllItems {
    return [self.filteredItems copy]; // 返回过滤后数组的副本
}

- (TodoItem *)itemAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.filteredItems.count) {
        return nil;
    }
    return self.filteredItems[index];
}

- (void)removeItemAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.filteredItems.count) {
        [self.items removeObject:self.filteredItems[index]]; // 同时从主数组中移除
        [self.filteredItems removeObjectAtIndex:index];
    }
}

- (void)addItem:(TodoItem *)item {
    if (item) {
        [self.items addObject:item];
        [self.filteredItems addObject:item]; // 可选: 添加到过滤数组
    }
}

- (void)updateItemAtIndex:(NSInteger)index withItem:(TodoItem *)item {
    TodoItem *currentItem = [self itemAtIndex:index];
    currentItem = item;
}

- (NSArray<TodoItem *> *)itemsMatchingQuery:(NSString *)query {
    if (query.length == 0) {
        [self.filteredItems removeAllObjects];
        [self.filteredItems addObjectsFromArray:self.items];
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS[cd] %@", query];
        self.filteredItems = [[self.items filteredArrayUsingPredicate:predicate] mutableCopy];
    }
    return [self.filteredItems copy];
}

- (void)resetFilteredItems {
    [self.filteredItems removeAllObjects];
    [self.filteredItems addObjectsFromArray:self.items];
}

@end
