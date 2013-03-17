//
//  NSManagedObject+TMCDImporting.m
//  TMCoreData
//
//  Created by Tony Million on 04/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSManagedObject+TMCDImporting.h"
#import "NSManagedObject+TMCDCreation.h"
#import "NSManagedObject+TMCDFinding.h"

#import "NSEntityDescription+TMCDPrimaryKey.h"
#import "TMCDLog.h"

#import "NSString+TMCDAdditions.h"

@implementation NSManagedObject (TMCDImporting)

//override this in your own class if you have a custom dateformatter requirement
// or even better override the importYourproperty: method and use your own fancy stuff!
-(NSDateFormatter*)defaultDateFormatter
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

-(BOOL)importValue:(id)value forKey:(NSString *)key
{
    NSString *selectorString = [NSString stringWithFormat:@"import%@:", [key capitalizedFirstLetterString]];
    SEL selector = NSSelectorFromString(selectorString);
    if ([self respondsToSelector:selector])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        BOOL imported = (BOOL)[self performSelector:selector
                                         withObject:value];
#pragma clang diagnostic pop
        
        return imported;
    }
    
    return NO;
}

-(NSString *)lookupKeyForAttribute:(NSAttributeDescription *)attributeInfo
{
    //NSString *attributeName = [attributeInfo name];
    //NSString *lookupKey     =  [[attributeInfo userInfo] valueForKey:@"keyPath"] ?: attributeName;
    
    return [[attributeInfo userInfo] valueForKey:@"keyPath"];
}

-(void)safeImportValuesFromDictionary:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context

{
    //NSArray      *dictKeys      = [dict allKeys];
    NSDictionary *attributes    = [[self entity] attributesByName];
    
    for(NSString * attributeName in attributes)
    {
        NSAttributeDescription * desc   = [attributes objectForKey:attributeName];
        NSString *entityKey             = [desc name];
        
        NSString *attributeName         = [desc name];
        NSString *dictKeyPath           = [self lookupKeyForAttribute:desc];
        
        /*TODO:
         
         Ok we know the keypath into the dictionary and we know the entity key
         in which to store it.
         
         */
        id value = nil;
        if(dictKeyPath)
        {
            value = [dict valueForKeyPath:dictKeyPath];
        }
        else
        {
            value = [dict valueForKey:attributeName];
        }
        
        if(!value)
        {
            //TMCDLog(@"dict does not contain key %@", dictKeyPath)            
            continue;
        }
        
        // attempt an import on ourselves!
        if([self importValue:value
                      forKey:entityKey])
        {
            //TMCDLog(@"HANDLED USING CUSTOM IMPORTER");
        }
        else
        {
            NSAttributeType attributeType = [desc attributeType];
            
            if ((attributeType == NSStringAttributeType) && ([value isKindOfClass:[NSNumber class]]))
            {
                value = [value stringValue];
            }
            else if (((attributeType == NSInteger16AttributeType) ||
                      (attributeType == NSInteger32AttributeType) ||
                      (attributeType == NSInteger64AttributeType) ||
                      (attributeType == NSBooleanAttributeType)) && ([value isKindOfClass:[NSString class]]))
            {
                value = [NSNumber numberWithInteger:[value integerValue]];
            }
            else if ((attributeType == NSFloatAttributeType) &&  ([value isKindOfClass:[NSString class]]))
            {
                value = [NSNumber numberWithDouble:[value doubleValue]];
            }
            else if ((attributeType == NSDateAttributeType) && ([value isKindOfClass:[NSString class]]) )
            {
                NSDateFormatter * df = [self defaultDateFormatter];
                
                NSDate * tempDate = [df dateFromString:value];
                value = tempDate;
            }
            else if(attributeType == NSObjectIDAttributeType)
            {
                //TMCDLog(@"attributeType == NSObjectIDAttributeType for attr: %@", entityKey);
            }
            else if(attributeType == NSBinaryDataAttributeType)
            {
                //TMCDLog(@"attributeType == NSBinaryDataAttributeTypefor attr: %@", entityKey);
            }
            else if(attributeType == NSTransformableAttributeType)
            {
                //TMCDLog(@"attributeType == NSTransformableAttributeType attr: %@", entityKey);
            }
            else if([value isKindOfClass:[NSNull class]])
            {
                //TMCDLog(@"value was a NSNull - replacing!!!!!!!!!!!!");
                value = nil;
            }
            
            if(value)
            {
                [self setValue:value
                        forKey:entityKey];
            }
        }
    }
    
    
    //TODO: what about relationships and stuff :/
    // set the exact relationship matches
    
    NSDictionary* relationships = [[self entity] relationshipsByName];
    for(NSString* relationship in relationships)
    {
        NSRelationshipDescription* description = [relationships objectForKey:relationship];

        id value = [dict objectForKey:relationship];
        if(!value)
        {
            continue;
        }

        if([self importValue:value
                      forKey:relationship])
        {
        }
        else
        {
            NSEntityDescription* destination = [description destinationEntity];
            Class class = NSClassFromString([destination managedObjectClassName]);

            id objects = [class objectWithObject:value
                                       inContext:context];
            
            if([objects isKindOfClass:[NSArray class]])
            {
                objects = [NSSet setWithArray:objects];
            }
            
            if(objects == nil)
            {
                continue;
            }
            
            [self setValue:objects
                    forKey:relationship];
        }
        
    }
}

+(id)importFromDictionary:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context
{
    id exisingObject = nil;
    
    if([self respondsToSelector:@selector(findExistingWithDictionary:inContext:)])
    {
        SEL findExistingSEL = @selector(findExistingWithDictionary:inContext:);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        exisingObject = [[self class] performSelector:findExistingSEL
                                           withObject:dict
                                           withObject:context];
        
#pragma clang diagnostic pop
    }

    // ok lets check the "primaryKey" KVP on the entity user info
    if(!exisingObject)
    {
        NSString *primaryKeyName = [[self entityDescriptionInContext:context] primaryKey];
        
        if(primaryKeyName)
        {
            id value = [dict valueForKey:primaryKeyName];
            
            if(value)
            {
                NSManagedObject *managedObject = [self findFirstWhereProperty:primaryKeyName
                                                                    isEqualTo:value
                                                                    inContext:context];
                
                if(managedObject)
                {
                    exisingObject = managedObject;
                }
            }
        }
    }
    
    // ok as far as we can tell the object doesn't exist, so create it!
    if(!exisingObject)
    {
        exisingObject = [self createInContext:context];
    }
    
    // and then import the data into the object!
    [exisingObject safeImportValuesFromDictionary:dict
                                        inContext:context];
    
    return exisingObject;
}


+(NSArray*)importFromArray:(NSArray*)dictArray inContext:(NSManagedObjectContext*)context
{
    NSMutableArray * importedObjects = [NSMutableArray arrayWithCapacity:dictArray.count];
    
    [dictArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary * dict = obj;
        
        id imported = [self importFromDictionary:dict
                                       inContext:context];
        
        [importedObjects addObject:imported];
    }];
    
    return importedObjects;
}

+(id)objectWithObject:(id)arrayOrDictionary inContext:(NSManagedObjectContext*)context
{
    if([arrayOrDictionary isKindOfClass:[NSString class]] || [arrayOrDictionary isKindOfClass:[NSNumber class]])
    {
        // this is probably a single primary key
        // this probably needs an entity type eh ?
        
        id stringOrNumber = arrayOrDictionary;
        
        NSString *primaryKeyName = [[self entityDescriptionInContext:context] primaryKey];
        
        if(primaryKeyName)
        {
            if(stringOrNumber)
            {
                NSManagedObject *managedObject = [self findFirstWhereProperty:primaryKeyName
                                                                    isEqualTo:stringOrNumber
                                                                    inContext:context];
                
                if(managedObject)
                {
                    return managedObject;
                }
            }
        }
        return nil;
    }
    
    if([arrayOrDictionary isKindOfClass:[NSDictionary class]])
    {
        return [[self class] importFromDictionary:arrayOrDictionary
                                        inContext:context];
    }
    
    if([arrayOrDictionary isKindOfClass:[NSArray class]])
    {
        return [[self class] importFromArray:arrayOrDictionary inContext:context];
    }
    
    NSAssert(0, @"Something went wrong! JSON should only be a dictionary or array");
    return nil;
}

@end
