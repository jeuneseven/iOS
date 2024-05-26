//
//  AddViewController.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "TodoItemDetailViewController.h"

@interface TodoItemDetailViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UILabel *todoLabel;
@property (strong, nonatomic) UITextField *todoInput;

@property (nonatomic) CGFloat appWidth;
@property (nonatomic) CGFloat appHeight;

@end

@implementation TodoItemDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"New To-Do";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(didTapDoneButton)];
    if (!self.todo) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapCancelButton)];
    }
    
    //******* CG ADDED BEGIN ***/
    //UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    //if (UIDeviceOrientationIsPortrait(deviceOrientation)) {
    //} else {
     //   self.appHeight =CGRectGetWidth(self.view.frame);
      //  self.appWidth=CGRectGetHeight(self.view.frame);
    //}
    //******* CG ADDED END ***/
    [self renderView];
}
- (void)renderView
{
    NSLog (@"Rotating! %f",CGRectGetWidth(self.view.frame));
    self.appWidth =CGRectGetWidth(self.view.frame);
    self.appHeight=CGRectGetHeight(self.view.frame);
    [self renderTodoText];
}
- (void)resizeView
{
    self.appWidth =CGRectGetWidth(self.view.frame);
    self.appHeight=CGRectGetHeight(self.view.frame);
    [self resizeTodoInput];
}
- (void) resizeTodoInput {
    self.todoInput.frame = CGRectMake(CGRectGetMinX(self.todoLabel.frame),
                                      CGRectGetMaxY(self.todoLabel.frame) + 5,
                                      self.appWidth - (40),
                                      40);
}

- (void)didTapDoneButton {
    if (self.todoInput.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid todo!" message:@"Check your todo - it's invalid!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Done", nil];
        [alertView show];
    } else {
        if (self.todo) {
            [self.delegate updateTodo:self.todoInput.text atRow:self.row];
        } else {
            [self.delegate createTodo:self.todoInput.text];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

}
- (void)didTapCancelButton {
    [self.delegate didCancelCreatingNewTodo];
}
- (void)renderTodoText {
    self.todoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 0, 0)];
    self.todoLabel.text = @"To-do:";
    self.todoLabel.font = [UIFont boldSystemFontOfSize:UIFont.systemFontSize];
    [self.todoLabel sizeToFit];
    [self.view addSubview:self.todoLabel];
    
    
    self.todoInput = [[UITextField alloc] init];
    if (self.todo) {
        self.todoInput.text = self.todo.text;
    }
    self.todoInput.borderStyle = UITextBorderStyleRoundedRect;
    self.todoInput.placeholder = @"Enter a to-do here.";
    self.todoInput.clearButtonMode = UITextFieldViewModeUnlessEditing;
    self.todoInput.delegate = self;
    [self resizeTodoInput];
    [self.view addSubview:self.todoInput];
}

- (id)initWithTodo:(TodoItem *)todo atRow:(NSUInteger)row {
    if (self = [super init]) {
        self.todo = todo;
        self.row =row;
    }
    return self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
