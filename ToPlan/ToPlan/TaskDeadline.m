//
//  TaskDeadline.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskDeadline.h"
#import "AppDelegate.h"
@implementation TaskDeadline
- (id)init
{
    if (self = [super init]) {
        NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
        //Format ID
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSString *str = appDelegate.selectedDate;
        [formater setDateFormat:@"yyyyMMdd"];
        NSDate *dateFromString = [[NSDate alloc] init];
        dateFromString = [formater dateFromString:str];
        _date = str;
        _taskType = @"";
        _taskName = @"New Name";
        _deadlineTime = dateFromString;
        _finished = false;
        _overdue=false;
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
    [encoder encodeBool:self.overdue forKey:@"overdue"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _date = [decoder decodeObjectForKey:@"date"];
        _taskType = [decoder decodeObjectForKey:@"taskType"];
        _taskName = [decoder decodeObjectForKey:@"taskName"];
        _deadlineTime = [decoder decodeObjectForKey:@"deadlineTime"];
        _finished = [decoder decodeBoolForKey:@"finished"];
        _overdue = [decoder decodeBoolForKey:@"oerdue"];
    }
    return self;
}
@end
