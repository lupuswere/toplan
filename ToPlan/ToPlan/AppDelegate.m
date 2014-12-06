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

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

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
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [NSKeyedArchiver archiveRootObject:self.taskDeadlineTable toFile:[self taskDeadlineTableStorageLocation]];
    [NSKeyedArchiver archiveRootObject:self.taskRecordTable toFile:[self taskRecordTableStorageLocation]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
