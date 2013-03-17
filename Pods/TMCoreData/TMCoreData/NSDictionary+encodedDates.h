//
//  NSDictionary+encodedDates.h
//  ObjectTest
//
//  Created by Tony Million on 30/12/2012.
//  Copyright (c) 2012 tonymillion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (encodedDates)

-(NSDictionary*)dictionaryWithDatesEncoded;
-(NSDictionary*)dictionaryWithDatesEncodedWithFormatter:(NSDateFormatter*)dateFormatter;

@end
