//
//  WorkRecords.m
//  ToPlan
//
//  Created by iGuest on 12/8/14.
//  Copyright (c) 2014 Other Candidates. All rights reserved.
//

#import "WorkRecords.h"
#import "AppDelegate.h"
#import "TaskDeadline.h"
#import "TaskDeadlineTable.h"
#import "loggingMacros.h"
#import "TaskTrackingViewController.h"
#import "TaskRecordTable.h"
#import "TaskRecord.h"

@interface WorkRecords()
@property (strong, nonatomic) TaskDeadlineTable *taskDeadlineTable;
@property (strong, nonatomic) NSMutableArray *allTaskDeadlines;
@property (strong,nonatomic) TaskRecordTable *taskRecordTable;
@property (strong,nonatomic) NSMutableArray *allRecord;
@end
@implementation WorkRecords
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.taskRecordTable= [appDelegate taskRecordTable];
    [self reBuildArray];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self reBuildArray];
    [self.tableView reloadData];
    [self.tableView setNeedsDisplay];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.allRecord.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //formate the start date of task
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"MM-dd hh:mm"];
    
    //format the end date
    NSDateFormatter *DateFormatter02=[[NSDateFormatter alloc] init];
    [DateFormatter02 setDateFormat:@"hh:mm"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allRecordCell" forIndexPath:indexPath];
    TaskRecord *thisTaskRecord = self.allRecord[indexPath.row];
    cell.textLabel.text = thisTaskRecord.taskNameRecord;
    //format the output of task record
    NSString *st=[DateFormatter stringFromDate:thisTaskRecord.startRecord];
    NSString *et=[DateFormatter02 stringFromDate:thisTaskRecord.endRecord];
    
    NSString *details=[NSString stringWithFormat:@"%@ %@ %@",st, @" To ",et];
    cell.detailTextLabel.text = details;
    cell.detailTextLabel.numberOfLines=1;
    cell.detailTextLabel.textColor=[UIColor grayColor];
    return cell;
}
- (void)reBuildArray
{
    self.allRecord = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSString *str = appDelegate.selectedDate;
    for(TaskRecord *record in self.taskRecordTable.taskRecords)
    {
        if([str isEqualToString:record.dateRecord]){
            [self.allRecord addObject:record];
        }
    }
}
- (IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        LogMethod();
    }];
}
@end
