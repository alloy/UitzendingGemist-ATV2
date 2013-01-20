#import "BRMediaType.h"

@implementation BRMediaType

+ (id)TVShow;
{
  BRMediaType *type = [[[self alloc] init] autorelease];
  type.typeString = @"TVShow";
  return type;
}

@end
