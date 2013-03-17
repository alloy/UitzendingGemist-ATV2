//
//  NSDictionary+encodedDates.m
//  ObjectTest
//
//  Created by Tony Million on 30/12/2012.
//  Copyright (c) 2012 tonymillion. All rights reserved.
//

#import "NSDictionary+encodedDates.h"

@implementation NSDictionary (encodedDates)

+(NSDateFormatter*)defaultDateFormatter
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

-(NSDictionary*)dictionaryWithDatesEncoded
{
    return [self dictionaryWithDatesEncodedWithFormatter:nil];
}

-(NSDictionary*)dictionaryWithDatesEncodedWithFormatter:(NSDateFormatter*)dateFormatter
{
    if(!dateFormatter)
    {
        dateFormatter = [NSDictionary defaultDateFormatter];
    }
    
    NSMutableDictionary * newDict = [NSMutableDictionary dictionaryWithCapacity:self.allKeys.count];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if([obj isKindOfClass:[NSDate class]])
        {
            NSString * encodedDate = [dateFormatter stringFromDate:obj];
            [newDict setObject:encodedDate forKey:key];
        }
        else
        {
            [newDict setObject:obj forKey:key];
        }
    }];
    
    return [NSDictionary dictionaryWithDictionary:newDict];
}


@end
