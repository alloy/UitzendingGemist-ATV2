#import "BRMenuItem.h"

@implementation BRMenuItem

- (id)init;
{
  if ((self = [super init])) {
    _accessoryType = UITableViewCellAccessoryNone;
  }
  return self;
}

- (void)addAccessoryOfType:(int)type;
{
  switch (type) {
    case 1:
      self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
      break;
    default:
      self.accessoryType = UITableViewCellAccessoryNone;
  }
}

@end
