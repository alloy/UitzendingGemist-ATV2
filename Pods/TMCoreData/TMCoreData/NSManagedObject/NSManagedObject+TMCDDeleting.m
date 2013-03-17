//
//  NSManagedObject+TMCDDeleting.m
//  journeys
//
//  Created by Tony Million on 16/03/2013.
//  Copyright (c) 2013 Narrato. All rights reserved.
//

#import "NSManagedObject+TMCDDeleting.h"
#import "NSManagedObject+TMCDFetching.h"

@implementation NSManagedObject (TMCDDeleting)

+(void)truncateInContext:(NSManagedObjectContext*)context
{
    NSFetchRequest * freq = [self createFetchRequestInContext:context];
    freq.includesPropertyValues = NO;
    freq.includesSubentities    = NO;

    NSError * error = nil;
    NSArray * objects = [context executeFetchRequest:freq
                                               error:&error];
    //error handling goes here
    for (NSManagedObject * obj in objects)
    {
        [context deleteObject:obj];
    }
}

@end
