//
//  TaskRecord.h
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskRecord : NSObject
@property (strong, nonatomic) NSString *dateRecord;
@property (strong, nonatomic) NSString *taskTypeRecord;
@property (strong, nonatomic) NSString *taskNameRecord;
@property (strong, nonatomic) NSDate *startRecord;
@property (strong, nonatomic) NSDate *endRecord;
@property (strong, nonatomic) NSNumber *timeUsing;

@end
