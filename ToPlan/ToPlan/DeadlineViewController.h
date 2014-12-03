//
//  DeadlineViewController.h
//  ToPlan
//
//  Created by Lifei Li on 14/11/24.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskDeadlineTable;
@interface DeadlineViewController : UIViewController
- (IBAction)addTaskDeadlineButton:(UIButton *)sender;
@property (strong, nonatomic) TaskDeadlineTable *taskDeadlineTable;
@end
