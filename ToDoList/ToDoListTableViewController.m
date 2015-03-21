//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by 孫　忠飛 on 3/16/15.
//  Copyright (c) 2015 pomn. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;
- (IBAction)startEdit:(id)sender;

@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    //[self loadInitialData];
    [self loadToDoItems];
    
    [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(_reloadTableView) userInfo:nil repeats:YES];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
//    [formatter setTimeZone:timeZone];
//    [formatter setDateFormat: @"yyyy-MM-dd HH:mm"];
//    cell.detailTextLabel.text = [formatter stringFromDate:toDoItem.creationDate];
    cell.detailTextLabel.text = [self _relativeDateStringForDate:toDoItem.creationDate];
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //NSLog(@"Deleted row %ld", indexPath.row);
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        //[self.tableView reloadData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    //[self.toDoItems exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    ToDoItem *moveItem = self.toDoItems[fromIndexPath.row];
    [self.toDoItems removeObjectAtIndex:fromIndexPath.row];
    [self.toDoItems insertObject:moveItem atIndex:toIndexPath.row];
//    for (ToDoItem *item in self.toDoItems) {
//        [item print];
//    }
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}



- (IBAction) unwindToList:(UIStoryboardSegue *)seque {
    AddToDoItemViewController *source = [seque sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (IBAction)startEdit:(id)sender {
    BOOL blEditing = self.tableView.editing;
    if (!blEditing) {
        self.navigationItem.leftBarButtonItem.style = UIBarButtonItemStyleDone;
        self.navigationItem.leftBarButtonItem.title = @"Done";
    } else {
        self.navigationItem.leftBarButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItem.title = @"Edit";
    }
    self.navigationItem.rightBarButtonItem.enabled = blEditing;
    [self.tableView setEditing:!blEditing animated:YES];
}


- (void) loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Read a book";
    [self.toDoItems addObject:item3];
    ToDoItem *item4 = [[ToDoItem alloc] init];
    item4.itemName = @"Eat cake";
    [self.toDoItems addObject:item4];
    ToDoItem *item5 = [[ToDoItem alloc] init];
    item5.itemName = @"Check email";
    [self.toDoItems addObject:item5];
}

- (NSString *)_relativeDateStringForDate:(NSDate *)date {
    NSCalendarUnit units = NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units fromDate:date toDate:[NSDate date] options:0];
    
    NSString *strResult = nil;
    if (components.year > 0) {
        strResult = [NSString stringWithFormat:@"%ld years ago", (long)components.year];
    } else if (components.month > 0) {
        strResult = [NSString stringWithFormat:@"%ld months ago", (long)components.month];
    } else if (components.weekOfYear > 0) {
        strResult = [NSString stringWithFormat:@"%ld weeks ago", (long)components.weekOfYear];
    } else if (components.day > 0) {
        strResult = [NSString stringWithFormat:@"%ld days ago", (long)components.day];
    } else if (components.hour > 0) {
        strResult = [NSString stringWithFormat:@"%ld hours ago", (long)components.hour];
    } else if (components.minute > 0) {
        strResult = [NSString stringWithFormat:@"%ld minutes ago", (long)components.minute];
    } else if (components.second > 0) {
        strResult = [NSString stringWithFormat:@"%ld seconds ago", (long)components.second];
    } else {
        strResult = @"just now";
    }
    
    return strResult;
}

- (void)_reloadTableView {
    [self.tableView reloadData];
}

- (void)saveToDoItems {
    //NSLog(@"saveToDoItems");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.toDoItems];
    [userDefaults setObject:data forKey:@"toDoItems"];
    [userDefaults synchronize];
}

- (void)loadToDoItems {
    //NSLog(@"loadToDoItems");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"toDoItems"];
    self.toDoItems = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
