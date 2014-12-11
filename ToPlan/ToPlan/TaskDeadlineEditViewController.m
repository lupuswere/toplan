//
//  TaskDeadlineEditViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskDeadlineEditViewController.h"
#import "AppDelegate.h"
#import "loggingMacros.h"
#import "TaskDeadLine.h"
@implementation TaskDeadlineEditViewController
- (void) viewDidLoad
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.taskRecordTable = [appDelegate taskRecordTable];
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
    [self.taskNameTextField endEditing:YES];
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




///
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.taskNameTextField) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


- (IBAction)getAdviceButton:(id)sender
{
    NSString *enteredText = [self.taskTypeTextField text];
    if(![enteredText isEqualToString:@""] && self.taskRecordTable.taskRecords.count!=0)
    {
        NSNumber *totalTimeUsing = 0;
        NSInteger count = 0;
//        NSInteger morning = 0;
//        NSInteger afternoon = 0;
//        NSInteger evening = 0;
        for(TaskRecord *tr in self.taskRecordTable.taskRecords)
        {
//            NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
//            [formater setDateFormat:@"yyyyMMdd"];
//            NSString *curTime = [formater stringFromDate:tr.dateRecord];
            if ([tr.taskTypeRecord caseInsensitiveCompare: enteredText]==NSOrderedSame)
            {
                //if(tr.startRecord.)
                count++;
                totalTimeUsing = [NSNumber numberWithDouble:(totalTimeUsing.doubleValue + tr.timeUsing.doubleValue)];
            }
        }
        if(count == 0)
        {
            self.adviceLabel.text = @"You don't have record of this type.";
        }
        else{
            NSNumber *averageUsing = [NSNumber numberWithDouble:(totalTimeUsing.doubleValue/count)];
            NSString *advice = [NSString stringWithFormat:@"%@ %@ %@ %@ %@", @"For task type", enteredText, @",do", averageUsing.stringValue, @"mins each time."];
            self.adviceLabel.text = advice;
            self.adviceLabel.numberOfLines=2;
        }
    }
    else{
        self.adviceLabel.text = @"You don't have record of this type.";
    }
}
@end
