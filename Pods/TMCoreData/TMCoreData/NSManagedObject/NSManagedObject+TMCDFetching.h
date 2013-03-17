//
//  NSManagedObject+TMCDFetching.h
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (TMCDFetching)

+(NSFetchRequest *)createFetchRequestInContext:(NSManagedObjectContext *)context;



+(NSArray *)executeFetchRequest:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context;
+(id)executeFetchRequestAndReturnFirstObject:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context;


+(NSFetchRequest *)requestWithPredicate:(NSPredicate *)predicate
                               sortedBy:(NSString *)sortTerm
                              ascending:(BOOL)ascending
                              inContext:(NSManagedObjectContext *)context;




+(NSFetchRequest *)requestAllWhere:(NSString *)property isEqualTo:(id)value inContext:(NSManagedObjectContext *)context;



+(NSFetchRequest*)requestAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;

+(NSFetchRequest *)requestAllSortedBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;

@end
