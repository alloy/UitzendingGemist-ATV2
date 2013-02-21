#import "BRController.h"
#import "BRControllerStack.h"

@interface BRController ()

@end

@implementation BRController

- (void)loadView
{
  self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (BRControllerStack *)stack;
{
  return (BRControllerStack *)self.navigationController;
}

//- (void)wasBuried;	// 0x315bf729
//{
  //[super wasBuried];
  //NSLog(@"%s", __PRETTY_FUNCTION__);
//}

//- (void)wasPopped;	// 0x3159abf9
//{
  //[super wasPopped];
  //NSLog(@"%s", __PRETTY_FUNCTION__);
//}

//- (void)wasPushed;
//{
  //[super wasPushed];
  //NSLog(@"%s", __PRETTY_FUNCTION__);
//}

//- (void)wasExhumed;
//{
  //[super wasExhumed];
  //NSLog(@"%s", __PRETTY_FUNCTION__);
//}

@end
