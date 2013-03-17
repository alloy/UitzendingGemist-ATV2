//
//  NSManagedObject+FetchedResults.m
//  TMCoreData
//
//  Created by Tony Million on 04/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSManagedObject+TMCDFetchedResults.h"

#import "NSManagedObject+TMCDFetching.h"

#import "TMCDLog.h"

@implementation NSManagedObject (TMCDFetchedResults)


+(NSFetchedResultsController *) fetchedResultsControllerWithPredicate:(NSPredicate *)predicate
                                                             sortedBy:(NSString *)sortTerm
                                                            ascending:(BOOL)ascending
                                                              groupBy:(NSString *)groupingKeyPath
                                                             delegate:(id<NSFetchedResultsControllerDelegate>)delegate
                                                            inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self requestWithPredicate:predicate
                                                sortedBy:sortTerm
                                               ascending:ascending
                                               inContext:context];
    
    if(!request)
        return nil;
    
    NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                 managedObjectContext:context
                                                                                   sectionNameKeyPath:groupingKeyPath
                                                                                            cacheName:nil];
    controller.delegate = delegate;
    
	NSError *error = nil;
	if(![controller performFetch:&error])
	{
        TMCDLog(@"performFetch ERROR: %@", error);
	}
    
    return controller;
}

+(NSFetchedResultsController *) fetchedResultsControllerWithPredicate:(NSPredicate *)predicate
                                                                limit:(NSUInteger)limit
                                                             sortedBy:(NSString *)sortTerm
                                                            ascending:(BOOL)ascending
                                                              groupBy:(NSString *)groupingKeyPath
                                                             delegate:(id<NSFetchedResultsControllerDelegate>)delegate
                                                            inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self requestWithPredicate:predicate
                                                sortedBy:sortTerm
                                               ascending:ascending
                                               inContext:context];

    if(!request)
        return nil;
    
    [request setFetchLimit:limit];
    
    NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                 managedObjectContext:context
                                                                                   sectionNameKeyPath:groupingKeyPath
                                                                                            cacheName:nil];
    controller.delegate = delegate;
    
	NSError *error = nil;
	if(![controller performFetch:&error])
	{
        TMCDLog(@"performFetch ERROR: %@", error);
	}
    
    return controller;
}


@end
