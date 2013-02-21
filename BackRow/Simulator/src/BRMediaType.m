#import "BRMediaType.h"

@implementation BRMediaType

+ (id)TVShow;
{
  BRMediaType *type = [[self alloc] init];
  type.typeString = @"TVShow";
  return type;
}

@end
