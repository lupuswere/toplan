//
//  TaskRecordTable.h
//  ToPlan
//
//  Created by Lifei Li on 14/12/3.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskRecordTable : NSObject
@property (strong, nonatomic) NSMutableArray *taskRecords;
- (void) addTaskRecord;
@end
