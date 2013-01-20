#import "BRController.h"

@implementation UINavigationController (BRController)

- (void)pushController:(BRController *)controller;
{
  [self pushViewController:controller animated:YES];
}

@end

@interface BRController ()

@end

@implementation BRController

- (void)loadView
{
  self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
}

- (id)stack;
{
  return self.navigationController;
}

@end
