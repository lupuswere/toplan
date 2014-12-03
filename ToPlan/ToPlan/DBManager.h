//
//  DBManager.h
//  ToPlan
//
//  Created by iGuest on 12/1/14.
//  Copyright (c) 2014 Other Candidates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBManager : NSObject
{
    NSString *databasePath;
}
+(DBManager*)getSharedInstance;
-(BOOL)createPlanDB;
-(BOOL)createTimeDB;
-(BOOL) savePlanData :(NSInteger) pid pdate:(NSDate*)pdate ptype:(NSString*)ptype
             deadline:(NSDate*)deadline isdone:(Boolean*)isdone;

-(NSArray*) findBydateinPlan:(NSDate*)pdate;
@end
