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
-(BOOL)createDB;
-(BOOL) saveData :(NSDate*)planDate ptype:(NSString*)ptype
      deadline:(NSDate*)deadline isdone:(Boolean*)isdone;

-(NSArray*) findByplanid:(NSDate*)planDate;
@end
