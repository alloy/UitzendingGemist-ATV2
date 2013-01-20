#import "UZGAppDelegate.h"
#import "GemistAppliance.h"

@implementation UZGAppDelegate

- (void)dealloc;
{
  [_window release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.window.backgroundColor = [UIColor whiteColor];

  GemistAppliance *appliance = [GemistAppliance new];
  self.window.rootViewController = [[BRControllerStack alloc] initWithRootViewController:appliance];

  [self.window makeKeyAndVisible];
  return YES;
}

@end
