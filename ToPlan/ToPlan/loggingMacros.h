//
//  loggingMacros.h
//  Survey Gerbil Part 1
//
//  Created by Lifei Li on 14-10-11.
//  Copyright (c) 2014年 Lifei Li. All rights reserved.
//

#if DEBUG
#define MyLog(args...)    NSLog( @"%@", [NSString stringWithFormat: args])
#define LogMethod() NSLog(@"%s (line %d) %@", __PRETTY_FUNCTION__, __LINE__, [NSThread isMainThread] ? @"" : [NSThread currentThread])

#else
// DEBUG not defined:

#define MyLog(args...)    // do nothing.
#define LogMethod()

#endif
