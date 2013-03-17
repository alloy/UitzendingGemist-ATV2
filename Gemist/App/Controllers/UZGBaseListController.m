#import "UZGBaseListController.h"

@implementation UZGBaseListController

- (instancetype)initWithContext:(NSManagedObjectContext *)context;
{
  if ((self = [super init])) {
    _managedObjectContext = context;
  }
  return self;
}

// Wrap around at top and bottom.
- (BOOL)brEventAction:(BREvent *)event;
{
  if (self.focusedControl == self.list && event.value == 1) {
    BOOL up = event.remoteAction == BREventUpButtonAction;
    BOOL down = event.remoteAction == BREventDownButtonAction;
    if (up || down) {
      NSInteger max = self.itemCount-1;
      if (max > 0) {
        // Wrap to bottom of list.
        if (up && self.list.selection == 0) {
          self.list.selection = max;
          return YES;
        // Wrap to top of list.
        } else if (down && self.list.selection == max) {
          self.list.selection = 0;
          return YES;
        }
      }
    }
  }
  return [super brEventAction:event];
}

@end
