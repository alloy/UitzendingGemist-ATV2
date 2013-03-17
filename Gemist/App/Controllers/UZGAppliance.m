#import "UZGAppliance.h"
#import "UZGBookmarksListController.h"
#import "UZGSearchListController.h"
#import "UZGShowsListController.h"
#import "UZGClient.h"

// TODO remove
#import "UZGPlistStore.h"

#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"

#import "AFHTTPRequestOperationLogger.h"

static NSString * const kUitzendingGemistName = @"Gemist";
static NSString * const kUZGBookmarksCategoryIdentifier = @"Favorites";
static NSString * const kUZGSearchCategoryIdentifier = @"Search";

@interface UZGApplianceInfo : BRApplianceInfo
@end

@implementation UZGApplianceInfo

- (NSDictionary *)info;
{
  return [UZGBundle infoDictionary];
}

- (NSString *)key;
{
  return self.info[(id)kCFBundleIdentifierKey];
}

- (NSString *)name;
{
  return self.info[(id)kCFBundleNameKey];
}

- (float)preferredOrder;
{
  return 0.0;
}

- (id)localizedStringsFileName;
{
  // return @"NitoTVLocalizable";
  return nil;
}

@end


#ifdef DEBUG
#import "PDDebugger.h"
#endif

// TODO not in actual release!!
// Only needed for beta testing.
//#ifdef DEBUG
//#define ENABLE_BETA_FEATURES 1
//#endif

#ifdef ENABLE_BETA_FEATURES
#import "HockeySDKConfig.h"
#import <HockeySDK/HockeySDK.h>
@interface UZGAppliance () <BITCrashManagerDelegate>
@property (assign) BOOL startedHockeyManager;
#else
@interface UZGAppliance ()
#endif
@property (assign) BOOL firstLaunch;
@property (strong) TMCoreData *coreDataStack;
@end

@implementation UZGAppliance

- (void)dealloc;
{
  NSLog(@"[Gemist] Clean up.");
  [UZGClient cleanUp];
  // TODO disable crash reporter?
}

- (id)init;
{
  if ((self = [super init])) {
    NSLog(@"[Gemist] Start appliance");
    _firstLaunch = YES;
    self.applianceInfo = [UZGApplianceInfo new];

    // TODO lazy-load, it's not needed when beigelist does its thing
    NSMutableArray *categories = [NSMutableArray array];
    [categories addObject:[BRApplianceCategory categoryWithName:UZGLocalizedString(kUZGBookmarksCategoryIdentifier)
                                                     identifier:kUZGBookmarksCategoryIdentifier
                                                 preferredOrder:0]];
    [categories addObject:[BRApplianceCategory categoryWithName:UZGLocalizedString(kUZGSearchCategoryIdentifier)
                                                     identifier:kUZGSearchCategoryIdentifier
                                                 preferredOrder:1]];

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

- (NSString *)persistentStorePath;
{
  return [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/nl.superalloy.Gemist/Store.sqlite"];
}

- (BOOL)needsMigration;
{
  NSFileManager *fm = [NSFileManager defaultManager];
  return ![fm fileExistsAtPath:self.persistentStorePath] && [fm fileExistsAtPath:[UZGPlistStore storePath]];
}

- (void)setupCoreDataStack;
{
  BOOL migrate = self.needsMigration;
  NSString *storePath = self.persistentStorePath;

  NSFileManager *fm = [NSFileManager defaultManager];
  if (![fm fileExistsAtPath:storePath]) {
    NSLog(@"[Gemist] Create app support dir: %@", [storePath stringByDeletingLastPathComponent]);
    [fm createDirectoryAtPath:[storePath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
  }

  self.coreDataStack = [[TMCoreData alloc] initWithLocalStoreURL:[NSURL fileURLWithPath:storePath]
                                                     objectModel:[NSManagedObjectModel mergedModelFromBundles:@[UZGBundle]]];

  if (migrate) [self migrateFromPlistStoreToCoreDataStack];
}

- (void)migrateFromPlistStoreToCoreDataStack;
{
  [self.coreDataStack saveInBackgroundWithBlock:^(NSManagedObjectContext *context) {
    NSLog(@"[Gemist] Migrating plist store:");
    UZGPlistStore *store = [UZGPlistStore new];

    NSLog(@"[Gemist] * Migrating episodes data.");
    for (NSString *path in store.episodePaths) {
      UZGEpisodeMediaAsset *episode = [UZGEpisodeMediaAsset createInContext:context];
      episode.path = path;
      // TODO
      episode.duration = [store durationOfEpisodeForPath:path];
      episode.bookmarkTimeInSeconds = [store bookmarkTimeForEpisodePath:path];
    }

    NSLog(@"[Gemist] * Migrating favorites data.");
    for (NSString *path in store.shows) {
      UZGShowMediaAsset *show = [UZGShowMediaAsset createInContext:context];
      show.path = path;
      [show setValuesForKeysWithDictionary:store.shows[path]];
    }
  } completion:^{
    BRControllerStack *stack = [[BRApplicationStackManager singleton] stack];
    [stack popController];
    [stack pushController:[[UZGBookmarksListController alloc] initWithContext:self.coreDataStack.mainThreadContext]];
  }];
}

- (id)identifierForContentAlias:(id)contentAlias; { return kUitzendingGemistName; }

- (id)localizedSearchTitle { return kUitzendingGemistName; }

- (id)applianceName { return kUitzendingGemistName; }

- (id)moduleName { return kUitzendingGemistName; }

- (id)applianceKey { return kUitzendingGemistName; }

- (BRController *)controllerForIdentifier:(id)identifier
                                     args:(id)args;
{
  BRController *controller = nil;

  if (self.firstLaunch) {
    self.firstLaunch = NO;

    if (self.needsMigration) {
      controller = [[BRTextWithSpinnerController alloc] initWithTitle:@"Migrating Data"
                                                                 text:@"Please wait until the process finishes."];
    }
    // TODO for now here so that it's not called when beigelist tries to
    // determine what type of appliance this is.
    [self setupCoreDataStack];

#ifdef DEBUG
    PDDebugger *debugger = [PDDebugger defaultInstance];
    [debugger enableNetworkTrafficDebugging];
    [debugger forwardAllNetworkTraffic];
    [debugger enableCoreDataDebugging];
    [debugger addManagedObjectContext:self.coreDataStack.mainThreadContext withName:@"Gemist Context"];
    [debugger autoConnect];
#endif

// TODO fix!
//#ifdef ENABLE_BETA_FEATURES
    //if (![[NSFileManager defaultManager] fileExistsAtPath:[UZGPlistStore storePath]]) {
      //controller = [self betaTestController];
    //}
    //// Always start manager before possibly returning controller.
    //[self startHockeyManager];

    //// Test the crash reporter.
    ////dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 20 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
      ////[@"" performSelector:@selector(ohNoes)];
    ////});
//#endif
  }

  if (controller == nil) {
    if ([identifier isEqualToString:kUZGSearchCategoryIdentifier]) {
      controller = [UZGSearchListController new];
    } else if ([identifier isEqualToString:kUZGBookmarksCategoryIdentifier]) {
      controller = [[UZGBookmarksListController alloc] initWithContext:self.coreDataStack.mainThreadContext];
    } else {
      controller = [[UZGShowsListController alloc] initWithTitleInitial:identifier];
    }
  }

  // NSLog(@"CONTROLLER: %@", controller);
  return controller;
}

#pragma mark - Beta features

#ifdef ENABLE_BETA_FEATURES
- (BRController *)betaTestController;
{
  if (self.startedHockeyManager) {
    return nil;
  }

  BRAlertController *controller = [BRAlertController new];
  controller.primaryText = @"Please register your device on\nrink.hockeyapp.net/manage/devices/new\nand thanks for testing! :)";
  controller.secondaryText = [NSString stringWithFormat:@"UDID: %@", [self deviceIdentifier]];
  controller.footerText = @"This alert will be shown on each app launch, until an episode has been partially seen or a show has been favorited.";
  return controller;
}

- (void)foobar;
{
}

- (NSString *)deviceIdentifier;
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  return [[UIDevice currentDevice] uniqueIdentifier];
#pragma clang diagnostic pop
}

- (void)startHockeyManager;
{
  if (self.startedHockeyManager) {
    return;
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
}

- (NSString *)userIDForHockeyManager:(BITHockeyManager *)hockeyManager
                    componentManager:(BITHockeyBaseManager *)componentManager;
{
  NSString *UDID = [self deviceIdentifier];
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

