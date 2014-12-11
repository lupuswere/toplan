//
//  DeadlineViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/11/24.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "DeadlineViewController.h"
#import "TaskDeadlineTable.h"
#import "TaskDeadline.h"
#import "AppDelegate.h"
#import "TaskDeadlineEditViewController.h"
#import "TaskListTableViewController.h"
@interface DeadlineViewController()
@property (assign, nonatomic) NSUInteger selectedTaskIndex;
@end
@implementation DeadlineViewController
- (void) viewDidLoad
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.taskDeadlineTable = [appDelegate taskDeadlineTable];
    self.title = @"Today";
    self.navigationItem.title = @"Today";
//    self.selectedTaskIndex = -1;
//    NSString *str = appDelegate.selectedDate;
//    for(TaskDeadline *task in self.taskDeadlineTable.taskDeadlines)
//    {
//        if([str isEqualToString:task.date])
//        {
//            self.selectedTaskIndex++;
//        }
//    }
    
    [self updateUI];
}
- (void) viewDidAppear:(BOOL)animated
{
    [self updateUI];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addTaskDeadline"]){
        TaskDeadlineEditViewController *destination = segue.destinationViewController;
        destination.theTaskDeadline = [self.taskDeadlineTable.taskDeadlines lastObject];
    }
}
- (IBAction)addTaskDeadlineButton:(UIButton *)sender
{
    [self.taskDeadlineTable addTaskDeadline];
    //self.selectedTaskIndex++;
}

- (void) updateUI
{
   
}

@end
