//
//  TaskDeadlineEditViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskDeadlineEditViewController.h"
#import "loggingMacros.h"
@implementation TaskDeadlineEditViewController
- (void) viewDidLoad
{
    self.taskNameTextField.text = self.theTaskDeadline.taskName;
    self.picker.date = self.theTaskDeadline.deadlineTime;
    self.taskTypeTextField.text = self.theTaskDeadline.taskType;
    if(self.theTaskDeadline.finished)
    {
        self.segmentControl.selectedSegmentIndex = 1;
    }
    else
    {
        self.segmentControl.selectedSegmentIndex = 0;
    }
}
- (IBAction)added:(id)sender
{
    self.theTaskDeadline.deadlineTime = self.picker.date;
    self.theTaskDeadline.taskName = self.taskNameTextField.text;
    self.theTaskDeadline.taskType = self.taskTypeTextField.text;
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd"];
    NSString *curTime = [formater stringFromDate:self.picker.date];
    self.theTaskDeadline.date = curTime;
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
    switch(self.segmentControl.selectedSegmentIndex)
    {
        case 0:
            self.theTaskDeadline.finished = false;
            break;
        case 1:
            self.theTaskDeadline.finished = true;
            break;
        default:
            break;
    }
}
@end
