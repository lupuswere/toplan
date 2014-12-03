//
//  TaskRecordTable.m
//  ToPlan
//
//  Created by Lifei Li on 14/12/3.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "TaskRecordTable.h"
#import "TaskRecord.h"
@implementation TaskRecordTable
- (id)init
{
    if (self = [super init]) {
        _taskRecords = [NSMutableArray array];
    }
    return self;
}
- (void)addTaskRecord
{
    [self.taskRecords addObject:[[TaskRecord alloc] init]];
}
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.taskRecords forKey:@"taskRecords"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _taskRecords = [decoder decodeObjectForKey:@"taskRecords"];
    }
    return self;
}
@end
