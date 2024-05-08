//
//  MainpageViewController.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "MainpageViewController.h"
#import "TodoItemManager.h"
#import "TodoItem.h"
#import "TodoDetailViewController.h"

@interface MainpageViewController ()

@property (strong, nonatomic) UISearchBar *searchBar;

@end

@implementation MainpageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Todo List";
    [self setupSearchBar];
    [self setupTableView];
    [self setupAddButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];  // Reload data every time the view appears
}

- (void)setupSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search Todos";
    [self.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchBar;

    // UI customization
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.barTintColor = [UIColor whiteColor];
    self.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.searchBar.tintColor = [UIColor blueColor]; // Changes the color of the cursor and the cancel button

    UITextField *searchTextField = [self.searchBar valueForKey:@"searchField"];
    if (searchTextField) {
        searchTextField.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        searchTextField.textColor = [UIColor darkGrayColor];
        searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
}

- (void)setupTableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TodoCell"];
}

- (void)setupAddButton {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self
                                                                                action:@selector(addNewTodo)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[TodoItemManager sharedManager] fetchFilteredTodos] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    TodoItem *item = [[[TodoItemManager sharedManager] fetchFilteredTodos] objectAtIndex:indexPath.row];
    cell.textLabel.text = item.text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TodoItem *item = [[[TodoItemManager sharedManager] fetchFilteredTodos] objectAtIndex:indexPath.row];
        [[TodoItemManager sharedManager] deleteTodo:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoDetailViewController *detailVC = [[TodoDetailViewController alloc] init];
    detailVC.todoItem = [[[TodoItemManager sharedManager] fetchFilteredTodos] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [[TodoItemManager sharedManager] searchTodosByTitle:searchText];
    [self.tableView reloadData];
}


- (void)addNewTodo {
    TodoDetailViewController *detailVC = [[TodoDetailViewController alloc] init];
    TodoItem *newItem = [[TodoItem alloc] init];
    detailVC.todoItem = newItem;
    // Setup the callback
    detailVC.onSave = ^{
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
