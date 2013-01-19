//
//  GemistAppliance.m
//  Gemist
//
//  Created by Eloy Durán on 1/19/13.
//  Copyright (c) 2013 SuperAlloy. All rights reserved.
//

#import "GemistAppliance.h"

@interface GemistAppliance ()
@end

@implementation GemistAppliance

//- (id)init;
//{
  //if ((self = [super init])) {
    //[[AFHTTPRequestOperationLogger sharedLogger] setLevel:AFLoggerLevelDebug];
    //[[AFHTTPRequestOperationLogger sharedLogger] startLogging];

    //NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:8 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    //[NSURLCache setSharedURLCache:URLCache];

    //[[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

    //[[UitzendingGemistAPIClient sharedClient] episodesOfShowAtPath:@"programmas/2237-wie-is-de-mol"
                                                              //page:1
                                                           //success:^(id _, id episodes) {
                                                                     //NSLog(@"%@", episodes);
                                                                   //}
                                                           //failure:^(id _, NSError *error) {
                                                                     //NSLog(@"ERROR: %@", error);
                                                                   //}];
  //}
  //return self;
//}

- (NSArray *)applianceCategories;
{
  if (_applianceCategories == nil) {
    NSMutableArray *categories = [NSMutableArray new];
    for(char c = 'A'; c <= 'Z'; c++) {
      NSString *name = [NSString stringWithFormat:@"%c", c];
      [categories addObject:[BRApplianceCategory categoryWithName:name
                                                       identifier:name
                                                   preferredOrder:(float)(c - 'A')]];
    }
    [categories addObject:[BRApplianceCategory categoryWithName:@"#"
                                                     identifier:@"#"
                                                 preferredOrder:(float)('Z' + 1)]];
    _applianceCategories = [categories copy];
  }
  return _applianceCategories;
}

- (id)controllerForIdentifier:(id)identifier args:(id)args;
{
  NSLog(@"SELECTED: %@", identifier);
  return nil;
}

- (id)localizedSearchTitle { return @"Gemist"; }
- (id)applianceName { return @"Gemist"; }
- (id)moduleName { return @"Gemist"; }
- (id)applianceKey { return @"Gemist"; }

@end

