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
@end
