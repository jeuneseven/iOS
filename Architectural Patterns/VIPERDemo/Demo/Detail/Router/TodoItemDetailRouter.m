//
//  TodoItemDetailRouter.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemDetailRouter.h"
#import "TodoItemDetailViewController.h"
#import "TodoItemDetailPresenter.h"
#import "TodoItemDetailInteractor.h"
#import "MainpageViewController.h"

@implementation TodoItemDetailRouter

+ (void)presentDetailPageInView:(UIViewController *)viewController withItem:(TodoItem *)item {
    
    TodoItemDetailViewController *detailVC = [[TodoItemDetailViewController alloc] init];
    

    TodoItemDetailPresenter *presenter = [[TodoItemDetailPresenter alloc] init];
    TodoItemDetailInteractor *interactor = [[TodoItemDetailInteractor alloc] init];
    
    detailVC.presenter = presenter;
    presenter.view = detailVC;
    presenter.interactor = interactor;
    presenter.currentItem = item;

    interactor.currentItem = presenter.currentItem;
    
    if ([viewController isKindOfClass:[MainpageViewController class]]) {
        presenter.delegate = (MainpageViewController *)viewController;
    }

    [viewController.navigationController pushViewController:detailVC animated:YES];
    
//    TodoItemDetailViewController *detailVC = [[TodoItemDetailViewController alloc] init];
//    TodoItemDetailPresenter *presenter = [[TodoItemDetailPresenter alloc] init];
//    TodoItemDetailInteractor *interactor = [[TodoItemDetailInteractor alloc] init];
//
//    detailVC.presenter = presenter;
//    presenter.view = detailVC;
//    presenter.interactor = interactor;
//    presenter.currentItem = item;
//
//    [viewController.navigationController pushViewController:detailVC animated:YES];
//    [detailVC configureWithItem:item];
}

@end
