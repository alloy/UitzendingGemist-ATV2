//
//  NSManagedObject+TMCDExporting.h
//  TMCoreData
//
//  Created by Tony Million on 04/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (TMCDExporting)

-(NSDictionary*)exportToDictionary;
-(NSDictionary*)exportToDictionaryIncludingRelationships:(BOOL)includeRelationships;

@end
