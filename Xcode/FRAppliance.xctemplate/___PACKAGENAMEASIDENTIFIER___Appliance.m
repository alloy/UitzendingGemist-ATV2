//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___PACKAGENAMEASIDENTIFIER___Appliance.h"

@interface ___PACKAGENAMEASIDENTIFIER___Appliance ()
@end

@implementation ___PACKAGENAMEASIDENTIFIER___Appliance

- (NSArray *)applianceCategories;
{
  if (_applianceCategories == nil) {
    _applianceCategories = @[[BRApplianceCategory categoryWithName:@"___PACKAGENAME___"
                                                        identifier:@"___PACKAGENAMEASIDENTIFIER___"
                                                    preferredOrder:0]];
  }
  return _applianceCategories;
}

- (id)localizedSearchTitle { return @"___PACKAGENAME___"; }
- (id)applianceName { return @"___PACKAGENAME___"; }
- (id)moduleName { return @"___PACKAGENAME___"; }
- (id)applianceKey { return @"___PACKAGENAME___"; }

@end

