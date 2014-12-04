//
//  TaskTrackingViewController.h
//  ToPlan
//
//  Created by GUWEINING on 14/12/3.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDeadline.h"
@interface TaskTrackingViewController : UIViewController
- (IBAction)getBeginTimeButton:(id)sender;
- (IBAction)getEndTimeButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeDifferenceLabel;
@property (strong, nonatomic) TaskDeadline *theTaskDeadline;

@end
