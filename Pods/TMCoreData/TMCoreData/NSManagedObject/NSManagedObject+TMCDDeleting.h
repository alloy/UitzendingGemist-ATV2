//
//  NSManagedObject+TMCDDeleting.h
//  journeys
//
//  Created by Tony Million on 16/03/2013.
//  Copyright (c) 2013 Narrato. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (TMCDDeleting)

+(void)truncateInContext:(NSManagedObjectContext*)context;

@end
