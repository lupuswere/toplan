//
//  TaskRecord.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskRecord.h"

@implementation TaskRecord
- (id)init
{
    if (self = [super init]) {
        NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
        NSDate *curDate = [NSDate date];
        [formater setDateFormat:@"yyyyMMdd"];
        NSString *curTime = [formater stringFromDate:curDate];
        //Format ID
        _dateRecord = curTime;
        _taskTypeRecord = @"";
        _taskNameRecord = @"New Name";
        _startRecord = curDate;
        _endRecord = curDate;
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.dateRecord forKey:@"dateRecord"];
    [encoder encodeObject:self.taskTypeRecord forKey:@"taskTypeRecord"];
    [encoder encodeObject:self.taskNameRecord forKey:@"taskNameRecord"];
    [encoder encodeObject:self.startRecord forKey:@"startRecord"];
    [encoder encodeObject:self.endRecord forKey:@"endRecord"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _dateRecord = [decoder decodeObjectForKey:@"dateRecord"];
        _taskTypeRecord = [decoder decodeObjectForKey:@"taskTypeRecord"];
        _taskNameRecord = [decoder decodeObjectForKey:@"taskNameRecord"];
        _startRecord = [decoder decodeObjectForKey:@"startRecord"];
        _endRecord = [decoder decodeObjectForKey:@"endRecord"];
    }
    return self;
}
@end
