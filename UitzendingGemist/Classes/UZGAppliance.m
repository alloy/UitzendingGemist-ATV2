#import "UZGAppliance.h"
#import "BRApplianceCategory.h"

@interface UZGAppliance ()
@property (nonatomic, strong) NSArray *applianceCategories;
@end

@implementation UZGAppliance

- (NSArray *)applianceCategories;
{
  if (_applianceCategories == nil) {
    NSMutableArray *categories = [NSMutableArray new];
    for(char c = 'A'; c <= 'Z'; c++) {
      NSString *name = [NSString stringWithFormat:@"%c", c];
      [categories addObject:[BRApplianceCategory categoryWithName:name
                                                       identifier:name
                                                   preferredOrder:(float)(c - 'A')]];
    }
    [categories addObject:[BRApplianceCategory categoryWithName:@"#"
                                                     identifier:@"#"
                                                 preferredOrder:(float)('Z' + 1)]];
    _applianceCategories = [categories copy];
  }
  return _applianceCategories;
}

- (id)controllerForIdentifier:(id)identifier args:(id)args;
{
  NSLog(@"SELECTED: %@", identifier);
  return nil;
}

// TODO which one is the title?
//- (id)localizedSearchTitle { return @"Hello World"; }
- (id)applianceName { return @"Uitzending Gemist"; }
//- (id)moduleName { return @"Hello World"; }
//- (id)applianceKey { return @"Hello World"; }

@end
