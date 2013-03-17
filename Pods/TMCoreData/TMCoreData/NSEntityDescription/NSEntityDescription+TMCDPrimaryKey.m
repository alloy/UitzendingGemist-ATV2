//
//  NSEntityDescription+TMCDPrimaryKey.m
//  TMCoreData
//
//  Created by Tony Million on 04/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSEntityDescription+TMCDPrimaryKey.h"

#import "TMCDLog.h"

@implementation NSEntityDescription (TMCDPrimaryKey)

-(NSString*)primaryKey
{
    NSString *lookupKey = @"primaryKey";
    NSDictionary *userInfo = [self userInfo];
    
    if ([userInfo count] == 0)
        return nil;
    
    NSString *primaryAttribute = [userInfo objectForKey:lookupKey];
    
    return primaryAttribute;
}


@end
