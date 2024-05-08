//
//  TodoItemDetailViewController.m
//  Demo
//
//  Created by on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemDetailViewController.h"
#import "TodoItemDetailPresenter.h"
#import "TodoItem.h"

@implementation TodoItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self.presenter loadItem]; // Ensure the view is configured when loaded
}

- (void)setupUI {
    self.navigationItem.title = self.presenter.currentItem ? @"Edit Todo" : @"Add Todo";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 40)];
    self.titleTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.titleTextField];

    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItem)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)configureWithItem:(TodoItem *)item {
    if (item) {
        self.titleTextField.text = item.title;
        self.presenter.currentItem = item;
    } else {
        self.titleTextField.text = @"";
        self.presenter.currentItem = nil; // Prepare for new item creation
    }
}

- (void)saveItem {
    [self.presenter saveItemWithTitle:self.titleTextField.text];
}

@end
