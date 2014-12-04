//
//  TaskTrackingViewController.m
//  ToPlan
//
//  Created by GUWEINING on 14/12/3.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskTrackingViewController.h"
#import "TaskDeadlineEditViewController.h"
@implementation TaskTrackingViewController

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
    self.startTimeLabel.text = [DateFormatter stringFromDate:[NSDate date]];
}

- (IBAction)getEndTimeButton:(UIButton *)sender {
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"MMdd hh:mm"];
    self.endTimeLabel.text = [DateFormatter stringFromDate:[NSDate date]];
    
    // Get time difference
    NSDate *date1 = [DateFormatter dateFromString:self.startTimeLabel.text];
    NSDate *date2 = [DateFormatter dateFromString:self.endTimeLabel.text];
    NSTimeInterval timeDifference = [date2 timeIntervalSinceDate:date1]/60;
    NSString *timeDiff = [@(timeDifference) stringValue];
    self.timeDifferenceLabel.text = [NSString stringWithFormat:@"%@ %@", timeDiff, @"min"];
}
@end
