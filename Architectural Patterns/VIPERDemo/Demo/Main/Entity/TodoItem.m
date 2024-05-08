//
//  TodoItem.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

- (BOOL)isEqualToTodoItem:(TodoItem *)item {
    if (!item) {
        return NO;
    }
    return [self.title isEqualToString:item.title];
}

@end
