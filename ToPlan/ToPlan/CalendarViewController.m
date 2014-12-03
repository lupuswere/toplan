//
//  FirstViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/11/13.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "CalendarViewController.h"
#import "CKCalendarView.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "DBManager.h"
@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showCalendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCalendar {
    CKCalendarView *calendar = [[CKCalendarView alloc] init];
    calendar.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 320);
    [self.view addSubview:calendar];
    calendar.delegate = self;
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    //TODO
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd"];
    NSString *curTime = [formater stringFromDate:date];
    appDelegate.selectedDate = curTime;
}

- (void)calendar:(CKCalendarView *)calendar didDeselectDate:(NSDate *)date {
    //TODO
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd"];
    NSString *curTime = [formater stringFromDate:date];
    appDelegate.selectedDate = curTime;
}

@end
