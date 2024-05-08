//
//  MainpagePresenter.h
//  Demo
//
//  Created by  on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainpageViewController.h"
#import "MainpageInteractor.h"
#import "MainpageRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainpagePresenter : NSObject
@property (nonatomic, strong) MainpageViewController *view;
@property (nonatomic, strong) MainpageInteractor *interactor;
@property (nonatomic, strong) MainpageRouter *router;
@property (nonatomic, assign) NSInteger selectedIndex;

- (void)updateView;
- (void)didSelectItemAtIndex:(NSInteger)index;
- (void)didRemoveItemAtIndex:(NSInteger)index;
- (void)searchItemsWithQuery:(NSString *)query;
- (NSArray<TodoItem *> *)getAllItems;
- (void)addNewItem;

@end

NS_ASSUME_NONNULL_END
