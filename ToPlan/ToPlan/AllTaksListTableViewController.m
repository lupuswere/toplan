//
//  AllTaksListTableViewController.m
//  ToPlan
//
//  Created by iGuest on 12/3/14.
//  Copyright (c) 2014 Other Candidates. All rights reserved.
//

#import "AllTaksListTableViewController.h"
#import "AppDelegate.h"
#import "TaskDeadline.h"
#import "TaskDeadlineTable.h"
#import "loggingMacros.h"
#import "TaskTrackingViewController.h"
#import "TaskDeadlineEditViewController.h"
@interface AllTaksListTableViewController()
@property (strong, nonatomic) TaskDeadlineTable *taskDeadlineTable;
@property (strong, nonatomic) NSMutableArray *allTaskDeadlines;
@end

@implementation AllTaksListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.taskDeadlineTable = [appDelegate taskDeadlineTable];
    [self reBuildArray];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self reBuildArray];
    [self.tableView reloadData];
    [self.tableView setNeedsDisplay];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.allTaskDeadlines.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSSortDescriptor * sortByDeadlineDate = [NSSortDescriptor sortDescriptorWithKey:@"deadlineTime" ascending:YES];
//    [self.taskDeadlineTable.taskDeadlines sortUsingDescriptors:[NSArray arrayWithObject:sortByDeadlineDate]];
//    NSSortDescriptor *sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"deadlineTime" ascending:YES];
//    NSArray *sortDescriptors = [NSArray arrayWithObject: sortByDate];
//    NSMutableArray *sortedEventArray = [self.taskDeadlineTable.taskDeadlines sortUsingDescriptors: sortDescriptors];
//    self.taskDeadlineTable.taskDeadlines = sortedEventArray;

    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //NSString *str = appDelegate.selectedDate;
    //MyLog(@"section %zd row %zd", indexPath.section, indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllTaskDeadlineCell" forIndexPath:indexPath];
    TaskDeadline *thisTaskDeadline = self.allTaskDeadlines[indexPath.row];
    //if([str isEqualToString:thisTaskDeadline.date])
    //{
    cell.textLabel.text = thisTaskDeadline.taskName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", thisTaskDeadline.deadlineTime];
    //if a task is overdue, make it orange
    if([thisTaskDeadline.deadlineTime compare:[NSDate date]] == NSOrderedAscending){
        thisTaskDeadline.overdue=true;
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", thisTaskDeadline.taskName, @"(overdue)"];
        
        [cell setBackgroundColor:[UIColor colorWithRed:2 green:.8 blue:.2 alpha:1]];
        
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    //}
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editTaskDeadline3"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        TaskDeadline *selectedTaskDeadline = self.taskDeadlineTable.taskDeadlines[indexPath.row];
        TaskTrackingViewController *destination = segue.destinationViewController;
        destination.theTaskDeadline = selectedTaskDeadline;
    }
}

- (void)reBuildArray
{
    NSSortDescriptor * sortByDeadlineDate = [NSSortDescriptor sortDescriptorWithKey:@"deadlineTime" ascending:YES];
    [self.taskDeadlineTable.taskDeadlines sortUsingDescriptors:[NSArray arrayWithObject:sortByDeadlineDate]];
    self.allTaskDeadlines = [[NSMutableArray alloc] init];
    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //NSString *str = appDelegate.selectedDate;
    for(TaskDeadline *task in self.taskDeadlineTable.taskDeadlines)
    {
        if(!task.finished){
            [self.allTaskDeadlines addObject:task];
        }
    }
}

- (IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_allTaskDeadlines removeObjectAtIndex:indexPath.row];
        [self.taskDeadlineTable removeTaskDeadlinesAtIndexes:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [tableView reloadData];
}
@end
