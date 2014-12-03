//
//  TaskDeadlineTable.h
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskDeadlineTable : NSObject
@property (strong, nonatomic) NSMutableArray *taskDeadlines;
- (void) addTaskDeadline;
@end
