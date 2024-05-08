//
//  MainpageRouter.h
//  Demo
//
//  Created by  on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TodoItem;
@class MainpageViewController;
@interface MainpageRouter : NSObject

+ (MainpageViewController *)createMainpage;
+ (void)presentDetailPageInView:(UIViewController *)viewController withItem:(TodoItem *)item;

@end

NS_ASSUME_NONNULL_END
