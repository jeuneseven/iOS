//
//  TodoItem.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoItem : NSObject

@property (nonatomic, strong) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;
- (BOOL)isEqualToTodoItem:(TodoItem *)item;

@end

NS_ASSUME_NONNULL_END
