//
//  TodoDetailViewController.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoDetailViewController.h"
#import "TodoItemManager.h"
#import "TodoItem.h"

@interface TodoDetailViewController ()

@property (nonatomic, strong) UITextField *titleTextField;

@end

@implementation TodoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupTitleTextField];
    [self setupNavigationBar];
}

- (void)setupTitleTextField {
    self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 40)];
    self.titleTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.titleTextField.placeholder = @"Enter todo title";
    self.titleTextField.text = self.todoItem ? self.todoItem.text : @"";
    self.titleTextField.delegate = self;
    [self.view addSubview:self.titleTextField];
}


- (void)setupNavigationBar {
    self.navigationItem.title = self.todoItem ? @"Edit Todo" : @"Add Todo";
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                target:self
                                                                                action:@selector(saveTodoItem)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)saveTodoItem {
    if (![[TodoItemManager sharedManager] todoItemExists:self.todoItem]) {
        
        self.todoItem.text = self.titleTextField.text;
        
        [[TodoItemManager sharedManager] addTodo:self.todoItem];
    } else {
        
        self.todoItem.text = self.titleTextField.text;
        [[TodoItemManager sharedManager] updateTodo:self.todoItem];
    }
    
    if (self.onSave) {
        self.onSave();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


// UITextFieldDelegate method to dismiss keyboard on return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
