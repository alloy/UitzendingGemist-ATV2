//
//  NSDictionary+removeNull.m
//  ObjectTest
//
//  Created by Tony Million on 29/12/2012.
//  Copyright (c) 2012 tonymillion. All rights reserved.
//

#import "NSDictionary+removeNull.h"

@implementation NSDictionary (removeNull)

-(NSDictionary *)dictionaryByPruningNulls
{
    return [self dictionaryWithValuesForKeys:[[self keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop) {
        return ![obj isEqual:[NSNull null]];
    }] allObjects]];
}


@end
