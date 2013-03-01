#import "UZGAppliance.h"
#import "UZGBookmarksListController.h"
#import "UZGShowsListController.h"
#import "AFHTTPRequestOperationLogger.h"

// TODO not in actual release!!
// Only needed for beta testing.
#ifdef DEBUG
#define ENABLE_BETA_FEATURES 1
#endif

#ifdef ENABLE_BETA_FEATURES
#import "UZGPlistStore.h"
#endif

static NSString * const kUitzendingGemistName = @"Gemist";
static NSString * const kUZGBookmarksCategoryIdentifier = @"Favorites";

@interface UZGAppliance ()
@end

@implementation UZGAppliance


- (id)init;
{
  if ((self = [super init])) {
    NSMutableArray *categories = [NSMutableArray array];
    [categories addObject:[BRApplianceCategory categoryWithName:UZGLocalizedString(kUZGBookmarksCategoryIdentifier)
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
#ifdef ENABLE_BETA_FEATURES
  if (![[NSFileManager defaultManager] fileExistsAtPath:[UZGPlistStore storePath]]) {
    NSLog(@"Plist store doesn't exist yet, show beta test controller!");
    return [self betaTestController];
  }
#endif

  BRController *controller = nil;
  if ([identifier isEqualToString:kUZGBookmarksCategoryIdentifier]) {
    controller = [UZGBookmarksListController new];
  } else {
    controller = [[UZGShowsListController alloc] initWithTitleInitial:identifier];
  }
  return controller;
}

#ifdef ENABLE_BETA_FEATURES
- (BRController *)betaTestController;
{
  NSString *UDID = [[UIDevice currentDevice] uniqueIdentifier];
  NSLog(@"UDID: %@", UDID);
  BRAlertController *controller = [BRAlertController alertForError:nil];
  controller.primaryText = [NSString stringWithFormat:@"Device ID: %@", UDID];
  controller.secondaryText = @"Please register your device on http://rink.hockeyapp.net and thanks for testing! :)";
  controller.footerText = @"This alert will no longer be shown once you have favorited a show.";
  return controller;
}
#endif

@end

