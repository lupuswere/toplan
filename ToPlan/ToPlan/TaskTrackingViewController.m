//
//  TaskTrackingViewController.m
//  ToPlan
//
//  Created by GUWEINING on 14/12/3.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "AppDelegate.h"
#import "TaskRecord.h"
#import "TaskRecordTable.h"
#import "TaskTrackingViewController.h"
#import "TaskDeadlineEditViewController.h"
@implementation TaskTrackingViewController

- (void) viewDidLoad
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.taskRecordTable = [appDelegate taskRecordTable];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editTaskDeadline2"]){
        TaskDeadlineEditViewController *destination = segue.destinationViewController;
        destination.theTaskDeadline = self.theTaskDeadline;
    }
}
- (IBAction)getBeginTimeButton:(UIButton *)sender {
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"MMdd hh:mm"];
    [self.taskRecordTable addTaskRecord];
    self.theTaskRecord = [self.taskRecordTable.taskRecords lastObject];
    self.startTimeLabel.text = [DateFormatter stringFromDate:self.theTaskRecord.startRecord];
}

- (IBAction)getEndTimeButton:(UIButton *)sender {
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"MMdd hh:mm"];
    self.endTimeLabel.text = [DateFormatter stringFromDate:[NSDate date]];
    self.theTaskRecord.endRecord = [DateFormatter dateFromString:self.endTimeLabel.text];
    
    // Get time difference
    NSDate *date1 = [DateFormatter dateFromString:self.startTimeLabel.text];
    NSDate *date2 = [DateFormatter dateFromString:self.endTimeLabel.text];
    NSTimeInterval timeDifference = [date2 timeIntervalSinceDate:date1]/60;
    NSString *timeDiff = [@(timeDifference) stringValue];
    self.timeDifferenceLabel.text = [NSString stringWithFormat:@"%@ %@", timeDiff, @"min"];
    
    // Add a new task record
    self.theTaskRecord.taskTypeRecord = self.theTaskDeadline.taskType;
    self.theTaskRecord.taskNameRecord = self.theTaskDeadline.taskName;
    
}
@end
