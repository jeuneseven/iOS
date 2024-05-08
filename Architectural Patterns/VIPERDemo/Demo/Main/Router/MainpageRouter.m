//
//  MainpageRouter.m
//  Demo
//
//  Created by  on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "MainpageRouter.h"
#import <Foundation/Foundation.h>
#import "TodoItem.h"
#import "TodoItemDetailViewController.h"
#import "TodoItemDetailPresenter.h"
#import "TodoItemDetailInteractor.h"
#import "MainpagePresenter.h"
#import "MainpageInteractor.h"
#import "MainpageViewController.h"
#import "TodoItemDetailViewController.h"
#import "TodoItemDetailRouter.h"

@interface MainpageRouter() 

@end

@implementation MainpageRouter

+ (MainpageViewController *)createMainpage {
    MainpageViewController *viewController = [[MainpageViewController alloc] init];
    MainpagePresenter *presenter = [[MainpagePresenter alloc] init];
    MainpageInteractor *interactor = [[MainpageInteractor alloc] init];

    viewController.presenter = presenter;
    presenter.view = viewController;
    presenter.interactor = interactor;

    return viewController;
}

+ (void)presentDetailPageInView:(UIViewController *)viewController withItem:(TodoItem *)item {
    [TodoItemDetailRouter presentDetailPageInView:viewController withItem:item];
}

@end

