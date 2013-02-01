#import "GemistAppliance.h"
#import "UZGTopShelfController.h"
#import "UZGBookmarksListController.h"
#import "UZGShowsListController.h"
#import "AFHTTPRequestOperationLogger.h"

static NSString * const kUitzendingGemistName = @"Gemist";
static NSString * const kUZGBookmarksCategoryIdentifier = @"Bookmarks";

@interface GemistAppliance ()
@end

@implementation GemistAppliance

- (void)dealloc;
{
  [_topShelfController release];
  [_applianceCategories release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _topShelfController = [UZGTopShelfController new];

    NSMutableArray *categories = [NSMutableArray array];
    [categories addObject:[BRApplianceCategory categoryWithName:kUZGBookmarksCategoryIdentifier
                                                     identifier:kUZGBookmarksCategoryIdentifier
                                                 preferredOrder:0]];
    for(char c = 'A'; c <= 'Z'; c++) {
      NSString *name = [NSString stringWithFormat:@"%c", c];
      [categories addObject:[BRApplianceCategory categoryWithName:name
                                                       identifier:name
                                                   preferredOrder:categories.count]];
    }
    [categories addObject:[BRApplianceCategory categoryWithName:@"#"
                                                     identifier:@"#"
                                                 preferredOrder:categories.count]];
    _applianceCategories = [categories copy];

    //[[AFHTTPRequestOperationLogger sharedLogger] setLevel:AFLoggerLevelDebug];
    [[AFHTTPRequestOperationLogger sharedLogger] setLevel:AFLoggerLevelWarn];
    [[AFHTTPRequestOperationLogger sharedLogger] startLogging];

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
  }
  return self;
}

- (id)identifierForContentAlias:(id)contentAlias; { return kUitzendingGemistName; }
- (id)localizedSearchTitle { return kUitzendingGemistName; }
- (id)applianceName { return kUitzendingGemistName; }
- (id)moduleName { return kUitzendingGemistName; }
- (id)applianceKey { return kUitzendingGemistName; }

- (id)selectCategoryWithIdentifier:(id)ident {
  // NSLog(@"[DEBUG] %s (%d): ident = %@", __PRETTY_FUNCTION__, __LINE__, ident);
  return nil;
}

- (BOOL)handleObjectSelection:(id)fp8 userInfo:(id)fp12 {
  // NSLog(@"[ENTRY] %s (%d): selection = %@, info = %@", __PRETTY_FUNCTION__, __LINE__, fp8, fp12);
  return YES;
}

- (id) applianceSpecificControllerForIdentifier:(id)arg1 args:(id)arg2 {
  // NSLog(@"applianceSpecificControllerForIdentifier: %@ args: %@", arg1, arg2);
  return nil;
}

- (BRController *)controllerForIdentifier:(id)identifier args:(id)args;
{
  // NSLog(@"SELECTED: %@", identifier);
  BRController *controller = nil;
  if ([identifier isEqualToString:kUZGBookmarksCategoryIdentifier]) {
    controller = [[UZGBookmarksListController new] autorelease];
  } else {
    controller = [[[UZGShowsListController alloc] initWithTitleInitial:identifier] autorelease];
  }
  return controller;
}

@end

