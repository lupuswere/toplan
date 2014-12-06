//
//  TaskListTableViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskListTableViewController.h"
#import "AppDelegate.h"
#import "TaskDeadline.h"
#import "TaskDeadlineTable.h"
#import "loggingMacros.h"
#import "TaskTrackingViewController.h"
#import "TaskDeadlineEditViewController.h"
@interface TaskListTableViewController()
@property (strong, nonatomic) TaskDeadlineTable *taskDeadlineTable;
@property (strong, nonatomic) NSMutableArray *currentTaskDeadlines;
@end

@implementation TaskListTableViewController
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
//    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    NSString *str = appDelegate.selectedDate;
//    int count = 0;
//    for(TaskDeadline *task in self.taskDeadlineTable.taskDeadlines)
//    {
//        if([str isEqualToString:task.date])
//        {
//            count = count + 1;
//        }
//    }
//    return (NSInteger)count;
    return self.currentTaskDeadlines.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //NSString *str = appDelegate.selectedDate;
    //MyLog(@"section %zd row %zd", indexPath.section, indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskDeadlineCell" forIndexPath:indexPath];
    TaskDeadline *thisTaskDeadline = self.currentTaskDeadlines[indexPath.row];
    //if([str isEqualToString:thisTaskDeadline.date])
    //{
        cell.textLabel.text = thisTaskDeadline.taskName;
        NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
        [DateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    cell.detailTextLabel.text = [DateFormatter stringFromDate:thisTaskDeadline.deadlineTime];
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", thisTaskDeadline.deadlineTime];
        if(thisTaskDeadline.finished)
        {
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", thisTaskDeadline.taskName, @"(finished)"];
            [cell setBackgroundColor:[UIColor colorWithRed:.2 green:.8 blue:.2 alpha:1]];
            cell.textLabel.textColor = [UIColor whiteColor];
        }
    
    
    //if a task is overdue, make it orange
    else if([thisTaskDeadline.deadlineTime compare:[NSDate date]] == NSOrderedAscending){
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
    if ([segue.identifier isEqualToString:@"editTaskDeadline"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        TaskDeadline *selectedTaskDeadline = self.currentTaskDeadlines[indexPath.row];
        TaskTrackingViewController *destination = segue.destinationViewController;
        destination.theTaskDeadline = selectedTaskDeadline;
    }
}

- (IBAction)Back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
}
- (void)reBuildArray
{
    self.currentTaskDeadlines = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSString *str = appDelegate.selectedDate;
    for(TaskDeadline *task in self.taskDeadlineTable.taskDeadlines)
    {
        if([str isEqualToString:task.date])
        {
            [self.currentTaskDeadlines addObject:task];
        }
    }
}


///delete tasks by sliding
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        [self.taskDeadlineTable removeTaskDeadlinesAtIndexes:indexPath.row];
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
//    [tableView reloadData];
//}

@end