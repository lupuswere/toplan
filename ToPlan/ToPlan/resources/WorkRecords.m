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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allRecordCell" forIndexPath:indexPath];
    TaskRecord *thisTaskRecord = self.allRecord[indexPath.row];
    cell.textLabel.text = thisTaskRecord.taskNameRecord;
    NSString *st=[NSString stringWithFormat:@"%@", thisTaskRecord.startRecord];
    NSString *et=[NSString stringWithFormat:@"%@", thisTaskRecord.endRecord];
    
    NSString *details=[NSString stringWithFormat:@"%@ %@ %@ %@", @"From ",st, @" To ",et];
    cell.detailTextLabel.text = details;
    cell.detailTextLabel.numberOfLines=2;
    cell.detailTextLabel.textColor=[UIColor grayColor];
    //if([thisTaskRecord.deadlineTime compare:[NSDate date]] == NSOrderedAscending){
//        thisTaskRecord.overdue=true;
//        
//        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", thisTaskRecord.taskName, @"(overdue)"];
//        
//        [cell setBackgroundColor:[UIColor colorWithRed:2 green:.8 blue:.2 alpha:1]];
//        
//        cell.textLabel.textColor = [UIColor whiteColor];
//    }
    //}
    return cell;
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"editTaskDeadline3"]){
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//        TaskDeadline *selectedTaskDeadline = self.taskDeadlineTable.taskDeadlines[indexPath.row];
//        TaskTrackingViewController *destination = segue.destinationViewController;
//        destination.theTaskDeadline = selectedTaskDeadline;
//    }
//}

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

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        [_allRecord removeObjectAtIndex:indexPath.row];
//        [self.taskDeadlineTable removeTaskDeadlinesAtIndexes:indexPath.row];
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
//    [tableView reloadData];
//}

@end
