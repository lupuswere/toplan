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
    return self.taskDeadlineTable.taskDeadlines.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyLog(@"section %zd row %zd", indexPath.section, indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskDeadlineCell" forIndexPath:indexPath];
    TaskDeadline *thisTaskDeadline = self.taskDeadlineTable.taskDeadlines[indexPath.row];
    cell.textLabel.text = thisTaskDeadline.taskName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", thisTaskDeadline.date];
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if([segue.identifier isEqualToString:@"editObservationFromTable"])
//    {
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//        Observation *selectedObservation = self.survey.observations[indexPath.row];
//        ObservationEditorViewController *destination = segue.destinationViewController;
//        destination.theObservation = selectedObservation;
//    }
}
- (IBAction)Back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
}
@end