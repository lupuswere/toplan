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
}
- (IBAction)added:(id)sender
{
    self.theTaskDeadline.deadlineTime = self.picker.date;
    self.taskNameTextField.text = self.theTaskDeadline.taskName;
    self.taskTypeTextField.text = self.theTaskDeadline.taskType;
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
}
@end
