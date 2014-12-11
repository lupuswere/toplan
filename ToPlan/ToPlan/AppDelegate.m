//
//  AppDelegate.m
//  ToPlan
//
//  Created by Lifei Li on 14/11/13.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "AppDelegate.h"
#import "TaskDeadlineTable.h"
#import "TaskRecordTable.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];
    [formater setDateFormat:@"yyyyMMdd"];
    NSString *curTime = [formater stringFromDate:curDate];
    _selectedDate = curTime;
    if (!(self.taskDeadlineTable = [NSKeyedUnarchiver unarchiveObjectWithFile:[self taskDeadlineTableStorageLocation]])) {
        self.taskDeadlineTable = [[TaskDeadlineTable alloc] init];
    }
    if (!(self.taskRecordTable = [NSKeyedUnarchiver unarchiveObjectWithFile:[self taskRecordTableStorageLocation]])) {
        self.taskRecordTable = [[TaskRecordTable alloc] init];
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {}
- (NSString *)applicationDocumentsFolderName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSParameterAssert(documentsDirectory);
    return documentsDirectory;
}
- (NSString *)taskDeadlineTableStorageLocation
{
    return [[self applicationDocumentsFolderName] stringByAppendingPathComponent:@"taskDeadlineTable"];
}
- (NSString *)taskRecordTableStorageLocation
{
    return[[self applicationDocumentsFolderName]stringByAppendingPathComponent:@"taskRecordTable"];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [NSKeyedArchiver archiveRootObject:self.taskDeadlineTable toFile:[self taskDeadlineTableStorageLocation]];
    [NSKeyedArchiver archiveRootObject:self.taskRecordTable toFile:[self taskRecordTableStorageLocation]];
}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}
@end
