//
//  DeadlineViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/11/24.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "DeadlineViewController.h"
#import "TaskDeadlineTable.h"
#import "TaskDeadline.h"
#import "AppDelegate.h"
@implementation DeadlineViewController
- (void) viewDidLoad
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"addTaskDeadline"]){
//        ObservationEditorViewController *destination = segue.destinationViewController;
//        destination.theObservation = self.survey.observations[self.selectedObservationIndex];
//    }
}
- (IBAction)addTaskDeadlineButton:(UIButton *)sender
{
    
}
@end
