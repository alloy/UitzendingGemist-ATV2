//
//  NSManagedObject+TMCDCreation.h
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (TMCDCreation)

+(NSString *)entityName;

+(NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context;

+(id)createInContext:(NSManagedObjectContext *)context;

-(BOOL)deleteInContext:(NSManagedObjectContext *)context;
-(BOOL)deleteManagedObject;

-(id)inContext:(NSManagedObjectContext *)otherContext;

@end
