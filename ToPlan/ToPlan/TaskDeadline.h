//
//  TaskDeadline.h
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskDeadline : NSObject
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *taskType;
@property (strong, nonatomic) NSString *taskName;
@property (strong, nonatomic) NSDate *deadlineTime;
@property BOOL finished;
@property BOOL overdue;

@end
