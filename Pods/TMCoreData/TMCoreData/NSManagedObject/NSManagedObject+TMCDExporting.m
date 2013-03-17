//
//  NSManagedObject+TMCDExporting.m
//  TMCoreData
//
//  Created by Tony Million on 04/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSManagedObject+TMCDExporting.h"
#import "NSDictionary+removeNull.h"
#import "NSDictionary+encodedDates.h"

#import "NSEntityDescription+TMCDPrimaryKey.h"
#import "TMCDLog.h"

#import "NSString+TMCDAdditions.h"

@implementation NSManagedObject (TMCDExporting)

-(NSDateFormatter*)defaultDateExporter
{
    static __strong NSDateFormatter * df = nil;
    
   	static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
		df = [[NSDateFormatter alloc] init];
		[df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        df.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    });
    
	return df;
}

-(NSDictionary*)exportToDictionary
{
    return [self exportToDictionaryWithSet:nil
                      includeRelationships:YES];
}

-(NSDictionary*)exportToDictionaryIncludingRelationships:(BOOL)includeRelationships
{
    return [self exportToDictionaryWithSet:nil
                      includeRelationships:includeRelationships];
}

-(id)exportRelationshipWithName:(NSString*)name
{
    NSString *selectorString = [NSString stringWithFormat:@"export%@", [name capitalizedFirstLetterString]];
    SEL selector = NSSelectorFromString(selectorString);
    if ([self respondsToSelector:selector])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        id exported = [self performSelector:selector];
#pragma clang diagnostic pop
        
        return exported;
    }
    
    return nil;
}

-(NSDictionary*)exportToDictionaryWithSet:(NSMutableSet*)objectSet includeRelationships:(BOOL)includeRelationships
{
    if(!objectSet)
    {
        objectSet = [NSMutableSet setWithCapacity:10];
    }
    else
    {
        if([objectSet containsObject:self]) {
            return nil;
        }
    }
    
    [objectSet addObject:self];
    
    NSArray *keys = [[[self entity] attributesByName] allKeys];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:keys];
    dict = [[dict dictionaryByPruningNulls] dictionaryWithDatesEncodedWithFormatter:self.defaultDateExporter];
    
    //TODO: export relationahips
    
    NSMutableDictionary *mutableDict = [dict mutableCopy];
    
    if(includeRelationships)
    {
        NSDictionary* relationships = [[self entity] relationshipsByName];
        
        for(NSString* relationship in relationships)
        {
            __strong id finalvalue = nil;
            
            // first we check to see if the class has an exportRelationship method
            finalvalue = [self exportRelationshipWithName:relationship];
            
            // if not
            if(!finalvalue)
            {
                NSRelationshipDescription* description = [relationships objectForKey:relationship];

                // check userinfo to see if we should export this relationship
                NSString * shouldExport = [description userInfo][@"shouldExport"];
                
                // if we get a shouldExport and its NOT 1-9 Y,y,T,t (more digits are ignored)
                if(shouldExport && (![shouldExport boolValue]))
                    continue;
                
                //TODO: check if this relationship links back to our type of object and if so, skip it!
                
                
                if(description.isToMany)
                {
                    // this should output an NSArray
                    TMCDLog(@"found to many for: %@", relationship);
                    
                    NSSet * allObjects = [self valueForKey:relationship];
                    NSMutableArray * exportedObjects = [NSMutableArray arrayWithCapacity:allObjects.count];
                    
                    [allObjects enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
                        NSManagedObject * manobj = obj;
                        
                        id subobj = [manobj exportToDictionaryWithSet:objectSet includeRelationships:includeRelationships];
                        if(subobj)
                            [exportedObjects addObject:subobj];
                    }];
                    
                    finalvalue = exportedObjects;
                }
                else
                {
                    // its 1:1
                    TMCDLog(@"1:1 relationship found!: %@", description);
                    NSEntityDescription* destination = [description destinationEntity];
                    TMCDLog(@"destination: %@", destination);
                    
    //                Class class = NSClassFromString([destination managedObjectClassName]);
                    
                    id relatedObject = [self valueForKey:relationship];
                    
                    finalvalue = [relatedObject exportToDictionaryWithSet:objectSet
                                                     includeRelationships:includeRelationships];
                    
                }
            }
            
            if(finalvalue)
            {
                [mutableDict setObject:finalvalue
                                forKey:relationship];
            }
        }
    }
    
    return mutableDict;
}

@end
