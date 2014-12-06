//
//  AppDelegate.h
//  ToPlan
//
//  Created by Lifei Li on 14/11/13.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskDeadlineTable;
@class TaskRecordTable;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *selectedDate;
@property (strong, nonatomic) TaskDeadlineTable *taskDeadlineTable;
@property (strong, nonatomic) TaskRecordTable *taskRecordTable;
@end

