//
//  NSString+TMCDAdditions.m
//  TMCoreData
//
//  Created by Tony Million on 04/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSString+TMCDAdditions.h"

@implementation NSString (TMCDAdditions)

-(NSString*)capitalizedFirstLetterString
{
    return [[self lowercaseString] stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                           withString:[[self substringToIndex:1] uppercaseString]];
}

@end
