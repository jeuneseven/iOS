//
//  MainpageViewController.m
//  Demo
//
//  Created by on 2024/4/21.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "MainpageViewController.h"
#import "MainpagePresenter.h"
#import "TodoItem.h"
#import "TodoItemDetailPresenter.h"

@interface MainpageViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, TodoItemDetailPresenterDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation MainpageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self.presenter updateView]; // Initial data load
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.presenter updateView]; // Initial data load
}

- (void)setupUI {
    self.title = @"Todo List";
    // Initialize and set up the table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // Initialize and set up the search bar
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    self.tableView.tableHeaderView = self.searchBar;
    self.searchBar.placeholder = @"Search Todos";
    self.searchBar.delegate = self;

    // Add a '+' button to the navigation bar
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewTodoItem)];
    self.navigationItem.rightBarButtonItem = addButton;
}

#pragma mark - Navigation

- (void)addNewTodoItem {
    // Assuming the presenter has a method to handle the addition of new items
    // If not, you need to define one in your presenter
    [self.presenter addNewItem];
}

- (void)todoItemDetailPresenterDidUpdateItem:(TodoItemDetailPresenter *)presenter todoItem:(nonnull TodoItem *)todoItem edit:(BOOL)isEdit {
    if (isEdit) {
        [self.presenter.interactor updateItemAtIndex:self.presenter.selectedIndex withItem:todoItem];
    } else {
        [self.presenter.interactor addItem:todoItem];
    }
    
    [self.presenter updateView];  // This should trigger a refresh of the view with updated data
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter getAllItems].count;  // Assuming the presenter has a method to return all items
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"TodoItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    TodoItem *item = [self.presenter getAllItems][indexPath.row]; // Assuming you have a method to get items by index
    cell.textLabel.text = item.title;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter didSelectItemAtIndex:indexPath.row]; // Make sure this matches the presenter's method
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.presenter didRemoveItemAtIndex:indexPath.row];  // Make sure this matches the presenter's method
    }
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.presenter searchItemsWithQuery:searchText];  // Make sure this matches the presenter's method
}

#pragma mark - View Interface

- (void)displayTodoItems:(NSArray<TodoItem *> *)items {
    [self.tableView reloadData];
}

- (void)showErrorMessage:(NSString *)message {
    // Display an alert or a toast with the error message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
