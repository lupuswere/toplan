//
//  TaskDeadline.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskDeadline.h"

@implementation TaskDeadline
- (id)init
{
    if (self = [super init]) {
        NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
        NSDate *curDate = [NSDate date];
        [formater setDateFormat:@"yyyyMMdd"];
        NSString *curTime = [formater stringFromDate:curDate];
        //Format ID
        _date = curTime;
        _taskType = @"";
        _taskName = @"New Name";
        _deadlineTime = curDate;
        _finished = false;
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.taskType forKey:@"taskType"];
    [encoder encodeObject:self.taskName forKey:@"taskName"];
    [encoder encodeObject:self.deadlineTime forKey:@"deadlineTime"];
    [encoder encodeBool:self.finished forKey:@"finished"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _date = [decoder decodeObjectForKey:@"date"];
        _taskType = [decoder decodeObjectForKey:@"taskType"];
        _taskName = [decoder decodeObjectForKey:@"taskName"];
        _deadlineTime = [decoder decodeObjectForKey:@"deadlineTime"];
        _finished = [decoder decodeBoolForKey:@"finished"];
    }
    return self;
}
@end
