#import "BRApplianceCategory.h"

@implementation BRApplianceCategory

+ (id)categoryWithName:(NSString *)name identifier:(NSString *)identifier preferredOrder:(float)order;
{
  BRApplianceCategory *category = [self new];
  category.name = name;
  category.identifier = identifier;
  category.preferredOrder = order;
  return category;
}

@end
