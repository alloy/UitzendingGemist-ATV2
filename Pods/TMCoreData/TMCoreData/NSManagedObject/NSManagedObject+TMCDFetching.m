//
//  NSManagedObject+TMCDFetching.m
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSManagedObject+TMCDFetching.h"
#import "NSManagedObject+TMCDCreation.h"

#import "TMCDLog.h"

@implementation NSManagedObject (TMCDFetching)

+(NSFetchRequest *)createFetchRequestInContext:(NSManagedObjectContext *)context
{
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription * ent = [self entityDescriptionInContext:context];
    if(!ent)
        return nil;
    
	[request setEntity:ent];
    
    return request;
}


// Fetch Request execution!
+(NSArray *)executeFetchRequest:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context
{
    __block NSArray *results = nil;
    [context performBlockAndWait:^{
        
        NSError *error = nil;
        
        results = [context executeFetchRequest:request
                                         error:&error];
        
        if(results == nil)
        {
        }
    }];
    
	return results;
}

+(id)executeFetchRequestAndReturnFirstObject:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context
{
    if(!request)
        return nil;
    
    // limit this request to 1 result!
	[request setFetchLimit:1];
    [request setFetchBatchSize:1];
	
	NSArray *results = [self executeFetchRequest:request
                                       inContext:context];
	if ([results count] == 0)
	{
		return nil;
	}
	return [results objectAtIndex:0];
}


// MAIN REQUEST CREATOR

+(NSFetchRequest *)requestWithPredicate:(NSPredicate *)predicate
                               sortedBy:(NSString *)sortTerm
                              ascending:(BOOL)ascending
                              inContext:(NSManagedObjectContext *)context
{
	NSFetchRequest *request = [self createFetchRequestInContext:context];
    
	if(predicate)
    {
        [request setPredicate:predicate];
    }
    
    if(sortTerm)
    {
        NSMutableArray* sortDescriptors = [[NSMutableArray alloc] init];
        NSArray* sortKeys = [sortTerm componentsSeparatedByString:@","];
        for(NSString* sortKey in sortKeys)
        {
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey
                                                                           ascending:ascending];
            [sortDescriptors addObject:sortDescriptor];
        }
        
        [request setSortDescriptors:sortDescriptors];
    }
    
    [request setFetchBatchSize:20];
    
	return request;
}







// Fetch Request helping stuff

+(NSFetchRequest *)requestAllWhere:(NSString *)property isEqualTo:(id)value inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];
    [request setPredicate:[NSPredicate predicateWithFormat:@"%K = %@", property, value]];
    
    return request;
}

+(NSFetchRequest*)requestAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context
{
    return [self requestWithPredicate:predicate sortedBy:nil ascending:NO inContext:context];
}


+(NSFetchRequest *)requestAllSortedBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context
{
    return [self requestWithPredicate:nil
                             sortedBy:sortTerm
                            ascending:ascending
                            inContext:context];
}


@end
