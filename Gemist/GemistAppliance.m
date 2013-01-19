//
//  GemistAppliance.m
//  Gemist
//
//  Created by Eloy Durán on 1/19/13.
//  Copyright (c) 2013 SuperAlloy. All rights reserved.
//

#import "GemistAppliance.h"

@interface GemistAppliance ()
@end

@implementation GemistAppliance

- (NSArray *)applianceCategories;
{
  if (_applianceCategories == nil) {
    _applianceCategories = @[[BRApplianceCategory categoryWithName:@"Gemist"
                                                        identifier:@"Gemist"
                                                    preferredOrder:0]];
  }
  return _applianceCategories;
}

- (id)localizedSearchTitle { return @"Gemist"; }
- (id)applianceName { return @"Gemist"; }
- (id)moduleName { return @"Gemist"; }
- (id)applianceKey { return @"Gemist"; }

@end

