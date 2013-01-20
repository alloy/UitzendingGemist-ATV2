#import "BRController.h"
#import "BRControllerStack.h"

@interface BRController ()

@end

@implementation BRController

- (void)loadView
{
  self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
}

- (BRControllerStack *)stack;
{
  return (BRControllerStack *)self.navigationController;
}

@end
