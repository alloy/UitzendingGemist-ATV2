#import "BRControllerStack.h"
#import "BRController.h"

@implementation BRControllerStack

- (void)pushController:(BRController *)controller;
{
  [self pushViewController:controller animated:YES];
}

@end
