//
//  TodoItemDetailRouter.h
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoItemDetailRouter : NSObject

+ (void)presentDetailPageInView:(UIViewController *)viewController withItem:(TodoItem *)item;

@end

NS_ASSUME_NONNULL_END
