#import "UZGAppliance.h"
#import "UZGBookmarksListController.h"
#import "UZGShowsListController.h"
#import "AFHTTPRequestOperationLogger.h"

static NSString * const kUitzendingGemistName = @"Gemist";
static NSString * const kUZGBookmarksCategoryIdentifier = @"Favorites";

@interface BRAlertController (UpdatedAPI)
@property (strong) NSString *footerText;
@end

// TODO not in actual release!!
// Only needed for beta testing.
#ifdef DEBUG
#define ENABLE_BETA_FEATURES 1
#endif

#ifdef ENABLE_BETA_FEATURES
#import "HockeySDKConfig.h"
#import "UZGPlistStore.h"
#import <HockeySDK/HockeySDK.h>
@interface UZGAppliance () <BITCrashManagerDelegate>
@property (assign) BOOL startedHockeyManager;
#else
@interface UZGAppliance ()
#endif
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
    BRController *controller = [self betaTestController];
    if (controller) {
      return controller;
    }
  }

  // Test the crash reporter.
  //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 20 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    //[@"" performSelector:@selector(ohNoes)];
  //});
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
  if (self.startedHockeyManager) {
    return nil;
  }

  NSLog(@"[Gemist] Enabling Crash Reporting");
  BITHockeyManager *manager = [BITHockeyManager sharedHockeyManager];
  [manager configureWithIdentifier:HOCKEY_SDK_APP_ID delegate:self];
  manager.debugLogEnabled = YES;
  manager.disableUpdateManager = YES;
  manager.disableFeedbackManager = YES;
  manager.crashManager.crashManagerStatus = BITCrashManagerStatusAutoSend;
  [manager startManager];

  self.startedHockeyManager = YES;

  BRAlertController *controller = [BRAlertController new];
  controller.primaryText = @"Please register your device on\nhttps://rink.hockeyapp.net/manage/devices/new\nand thanks for testing! :)";
  controller.secondaryText = [NSString stringWithFormat:@"Device ID: %@", [[UIDevice currentDevice] uniqueIdentifier]];
  controller.footerText = @"This alert will be shown after each device reboot until a show has been favorited.";
  return controller;
}

- (NSString *)userIDForHockeyManager:(BITHockeyManager *)hockeyManager
                    componentManager:(BITHockeyBaseManager *)componentManager;
{
  NSString *UDID = [[UIDevice currentDevice] uniqueIdentifier];
  NSLog(@"[Gemist] Hockey wants UDID: %@", UDID);
  return UDID;
}

- (void)crashManagerWillSendCrashReport:(BITCrashManager *)crashManager;
{
  NSLog(@"[Gemist] Submitting crash report...");
}

- (void)crashManager:(BITCrashManager *)crashManager didFailWithError:(NSError *)error;
{
  NSLog(@"[Gemist] Failed to submit crash report: %@", error);
}

- (void)crashManagerDidFinishSendingCrashReport:(BITCrashManager *)crashManager;
{
  NSLog(@"[Gemist] Did submit crash report! :)");
}

#endif

@end

