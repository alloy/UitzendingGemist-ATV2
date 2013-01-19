//
//  UZGAppDelegate.m
//  UitzendingGemist
//
//  Created by Eloy Durán on 1/17/13.
//  Copyright (c) 2013 SuperAlloy. All rights reserved.
//

#import "UZGAppDelegate.h"
#import "UitzendingGemistAPIClient.h"

#import "AFNetworkActivityIndicatorManager.h"
#import "AFHTTPRequestOperationLogger.h"

#import "UZGAppliance.h"

@implementation UZGAppDelegate

- (void)dealloc
{
  [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[AFHTTPRequestOperationLogger sharedLogger] setLevel:AFLoggerLevelDebug];
  [[AFHTTPRequestOperationLogger sharedLogger] startLogging];

  NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:8 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
  [NSURLCache setSharedURLCache:URLCache];

  [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

  //[[UitzendingGemistAPIClient sharedClient] episodesOfShowAtPath:@"programmas/2237-wie-is-de-mol"
                                                            //page:1
                                                         //success:^(id _, id episodes) {
                                                                   //NSLog(@"%@", episodes);
                                                                 //}
                                                         //failure:^(id _, NSError *error) {
                                                                   //NSLog(@"ERROR: %@", error);
                                                                 //}];

  UZGAppliance *appliance = [UZGAppliance new];
  self.navigationController = [[UINavigationController alloc] initWithRootViewController:appliance];

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = self.navigationController;
  [self.window makeKeyAndVisible];

  return YES;
}

@end
