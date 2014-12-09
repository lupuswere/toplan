//
//  TaskDeadlineEditViewController.h
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDeadline.h"
#import "TaskDeadlineTable.h"
#import "TaskRecord.h"
#import "TaskRecordTable.h"

@class TaskDeadline;
@interface TaskDeadlineEditViewController : UIViewController
@property (strong, nonatomic) TaskDeadline *theTaskDeadline;
@property (strong, nonatomic) TaskRecordTable *taskRecordTable;
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;
@property (weak, nonatomic) IBOutlet UITextField *taskTypeTextField;
- (IBAction)added:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)getAdviceButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *adviceLabel;



@end
