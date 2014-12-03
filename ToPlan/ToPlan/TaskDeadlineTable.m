//
//  TaskDeadlineTable.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/2.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskDeadlineTable.h"
#import "TaskDeadline.h"
@implementation TaskDeadlineTable
- (id)init
{
    if (self = [super init]) {
        _taskDeadlines = [NSMutableArray array];
    }
    return self;
}
- (void)addTaskDeadline
{
    [self.taskDeadlines addObject:[[TaskDeadline alloc] init]];
}
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.taskDeadlines forKey:@"taskDeadlines"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _taskDeadlines = [decoder decodeObjectForKey:@"taskDeadlines"];
    }
    return self;
}
@end
