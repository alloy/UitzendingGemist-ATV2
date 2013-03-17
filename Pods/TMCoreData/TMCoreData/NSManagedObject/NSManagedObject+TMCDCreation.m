//
//  NSManagedObject+TMCDCreation.m
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSManagedObject+TMCDCreation.h"

#import "TMCDLog.h"

@implementation NSManagedObject (TMCDCreation)

+(NSString *)entityName
{
    return NSStringFromClass(self);
}

+(NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context
{
    if(!context)
        return nil;
    
    NSString *entityName = [self entityName];
    
    NSEntityDescription * entDesc = nil;
    
    @try {
        entDesc =  [NSEntityDescription entityForName:entityName
                                                     inManagedObjectContext:context];
    }
    @catch (NSException *exception) {
        TMCDLog(@"A Coredata exception happened - this is not good and probably iClouds fault :(");
    }
    
    return entDesc;
}

+(id)createInContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                         inManagedObjectContext:context];
}

-(BOOL)deleteInContext:(NSManagedObjectContext *)context
{
	[context deleteObject:self];
	return YES;
}

-(BOOL)deleteManagedObject
{
    return [self deleteInContext:self.managedObjectContext];
}


-(id)inContext:(NSManagedObjectContext *)otherContext
{
    NSError *error = nil;
    
    if([[self objectID] isTemporaryID])
    {
        BOOL success = [self.managedObjectContext obtainPermanentIDsForObjects:@[self]
                                                                         error:&error];
        if (!success && error)
        {
            TMCDLog(@"obtainPermanentIDsForObjects - error: %@", error);
        }
    }
    
    NSManagedObject *inContext = [otherContext existingObjectWithID:[self objectID]
                                                              error:&error];
    
    if(!inContext)
    {
        TMCDLog(@"inContext fails: %@", error);
    }
    
    return inContext;
}

@end
