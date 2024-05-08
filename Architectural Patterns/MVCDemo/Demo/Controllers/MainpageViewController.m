//
//  MainpageViewController.m
//  Demo
//
//  Created by  on 2024/4/22.
//  Copyright © 2024 kkk. All rights reserved.
//

#import "MainpageViewController.h"

@interface MainpageViewController () <UIAlertViewDelegate, TodoItemDetailViewControllerDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *todolistArray;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *filteredTodolistArray;  // 存储过滤结果

@end

@implementation MainpageViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"To-Do List";
       // self.navigationItem.title = [NSString stringWithFormat:@"To-Do List %f", CGRectGetWidth(self.view.frame)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddButton)];
        [self.tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:@"UITableViewCell"];
    }
    return self;
}
- (NSString *)resourcePath {
    return [NSBundle.mainBundle.resourcePath  stringByAppendingPathComponent:@"todos"];
}
- (void) didTapAddButton
{
    TodoItemDetailViewController *createVC = [[TodoItemDetailViewController alloc] init];
    createVC.delegate = self;
    [self.navigationController pushViewController:createVC animated:YES];
}
//user selects a row, edits a todo
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoItem *todo = self.todolistArray[indexPath.row];
    TodoItemDetailViewController *createVC = [[TodoItemDetailViewController alloc] initWithTodo:todo atRow:indexPath.row];
    createVC.delegate = self;
    [self.navigationController pushViewController:createVC animated:YES];
    
}
//user hits 'Done' button in 'editTodo' popup
- (void)updateTodo: (NSString *)todo atRow:(NSUInteger)row;
{
    /* EDIT USING CUSTOM MODEL */
    TodoItem *item = [[TodoItem alloc] init];
    item.text = todo;
    [self.todolistArray replaceObjectAtIndex:row withObject:item];
    //sort data
    NSSortDescriptor *todoSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"text" ascending:YES];
    [self.todolistArray sortUsingDescriptors:@[todoSortDescriptor]];
    self.filteredTodolistArray = [NSMutableArray arrayWithArray:self.todolistArray];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *todoData = [NSKeyedArchiver archivedDataWithRootObject:self.todolistArray];
    [userDefaults setObject:todoData forKey:@"todolistArray"];
    [userDefaults synchronize];
    
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
   
}
//user hits 'Done' button in 'createTodo' popup
- (void)createTodo:(NSString *)todo
{
    /* CREATE USING CUSTOM MODEL */
    TodoItem *item = [[TodoItem alloc] init];
    item.text = todo;
    [self.todolistArray addObject:item];
    self.filteredTodolistArray = [NSMutableArray arrayWithArray:self.todolistArray];
    //sort data
    NSSortDescriptor *todoSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"text" ascending:YES];
    [self.todolistArray sortUsingDescriptors:@[todoSortDescriptor]];
    
    /********  PERSISTENT DATA USING Custom Model and saving to file */
    [NSKeyedArchiver archiveRootObject:self.todolistArray toFile:self.resourcePath];
    /********  PERSISTENT DATA USING Custom Model and NSUserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *todoData = [NSKeyedArchiver archivedDataWithRootObject:self.todos];
    [userDefaults setObject:todoData forKey:@"todos"];
    [userDefaults synchronize];*/
    
    
    /******** CREATE USING NSDICTIONARY
    NSDictionary *todoItem = @{@"text": todo, @"dueDate": dueDate};
    [self.todos addObject:todoItem];
    
    //add to persisent data
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.todos forKey:@"todos"];
    [userDefaults synchronize];
            */
    //reload tableView
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
//user hits 'Cancel' button in 'createTodo' popup
- (void)didCancelCreatingNewTodo
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
            //    NSString *input =[[alertView textFieldAtIndex:0] text];
            //      NSString *input =[alertView textFieldAtIndex:0].text;
            //    [self.todos addObject:input];
    //add to array
    [self.todolistArray addObject:[alertView textFieldAtIndex:0].text];
    self.filteredTodolistArray = [NSMutableArray arrayWithArray:self.todolistArray];
    /***** add to persistent data in file */
    [NSKeyedArchiver archiveRootObject:self.todolistArray toFile:[self resourcePath]];
    /*****  add to persisent data in NSUserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.todos forKey:@"todos"];
    [userDefaults synchronize];*/
    
    //reload tableView
    [self.tableView reloadData];
    //NSLog(@"%@",input);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.todolistArray = [[NSMutableArray alloc] init];
        
    self.filteredTodolistArray = [NSMutableArray arrayWithArray:self.todolistArray];

    

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search items";
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchBar.keyboardType = UIKeyboardTypeDefault;

    
    self.tableView.tableHeaderView = self.searchBar;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.filteredTodolistArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    TodoItem *item = self.filteredTodolistArray[indexPath.row];
    cell.textLabel.text = item.text;
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.filteredTodolistArray removeObjectAtIndex:indexPath.row];
        [self.todolistArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
   // else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //}
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        self.filteredTodolistArray = [NSMutableArray arrayWithArray:self.todolistArray];
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"text contains[c] %@", searchText];
                self.filteredTodolistArray = [NSMutableArray arrayWithArray:[self.todolistArray filteredArrayUsingPredicate:predicate]];
    }
    
    [self.tableView reloadData];
}


@end
