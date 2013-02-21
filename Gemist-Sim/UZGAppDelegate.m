#import "UZGAppDelegate.h"
#import "UZGAppliance.h"

@implementation UZGAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];

  UZGAppliance *appliance = [UZGAppliance new];
  self.window.rootViewController = [[BRControllerStack alloc] initWithRootViewController:appliance];

  [self.window makeKeyAndVisible];
  return YES;
}

@end
