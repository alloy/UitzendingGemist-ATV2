//
//  NSManagedObject+TMCDFinding.h
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (TMCDFinding)

+(NSUInteger)countInContext:(NSManagedObjectContext *)context;
+(NSUInteger)countWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;

+(NSArray *)findAllInContext:(NSManagedObjectContext *)context;

+(NSArray *)findAllSortedBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;

+(NSArray *)findAllWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;
+(NSArray *)findAllWhereProperty:(NSString *)property isEqualTo:(id)value inContext:(NSManagedObjectContext *)context;

+(id)findFirstSortedBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;
+(id)findFirstWhereProperty:(NSString *)property isEqualTo:(id)value inContext:(NSManagedObjectContext *)context;

+(id)findFirstWithPredicate:(NSPredicate*)predicate sortedBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;
+(id)findFirstWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;

@end
