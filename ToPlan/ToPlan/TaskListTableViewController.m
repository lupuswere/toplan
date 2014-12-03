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
#import "TaskDeadlineEditViewController.h"
@interface TaskListTableViewController()
@property (strong, nonatomic) TaskDeadlineTable *taskDeadlineTable;
@end

@implementation TaskListTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.taskDeadlineTable = [appDelegate taskDeadlineTable];
}
- (void)viewWillAppear:(BOOL)animated
{
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
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSString *str = appDelegate.selectedDate;
    int count = 0;
    for(TaskDeadline *task in self.taskDeadlineTable.taskDeadlines)
    {
        if([str isEqualToString:task.date])
        {
            count = count + 1;
        }
    }
    return (NSInteger)count;
    //return self.taskDeadlineTable.taskDeadlines.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSString *str = appDelegate.selectedDate;
    MyLog(@"section %zd row %zd", indexPath.section, indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskDeadlineCell" forIndexPath:indexPath];
    TaskDeadline *thisTaskDeadline = self.taskDeadlineTable.taskDeadlines[indexPath.row];
    if([str isEqualToString:thisTaskDeadline.date])
    {
        cell.textLabel.text = thisTaskDeadline.taskName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", thisTaskDeadline.deadlineTime];
        if(thisTaskDeadline.finished)
        {
            [cell setBackgroundColor:[UIColor colorWithRed:.2 green:.8 blue:.2 alpha:1]];
            cell.textLabel.textColor = [UIColor whiteColor];
        }
    }
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editTaskDeadline"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        TaskDeadline *selectedTaskDeadline = self.taskDeadlineTable.taskDeadlines[indexPath.row];
        TaskDeadlineEditViewController *destination = segue.destinationViewController;
        destination.theTaskDeadline = selectedTaskDeadline;
    }
}
- (IBAction)Back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
}
@end