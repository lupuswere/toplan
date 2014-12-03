//
//  SecondViewController.m
//  ToPlan
//
//  Created by Lifei Li on 14/11/13.
//  Copyright (c) 2014年 Other Candidates. All rights reserved.
//

#import "RecordViewController.h"
#import "AppDelegate.h"
@interface RecordViewController ()

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateUserInterface];
}
- (void)viewDidAppear:(BOOL)animated {
    [self updateUserInterface];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUserInterface {
    //TODO
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSString *str = appDelegate.selectedDate;
    self.forTest.text = str;
}
@end
