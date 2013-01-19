#import "GemistAppliance.h"
#import "UZGTopShelfController.h"

static NSString * const kUitzendingGemistName = @"Gemist";

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
  }
  return self;
}

- (id)identifierForContentAlias:(id)contentAlias; { return kUitzendingGemistName; }
- (id)localizedSearchTitle { return kUitzendingGemistName; }
- (id)applianceName { return kUitzendingGemistName; }
- (id)moduleName { return kUitzendingGemistName; }
- (id)applianceKey { return kUitzendingGemistName; }

- (id)selectCategoryWithIdentifier:(id)ident {
  NSLog(@"[DEBUG] %s (%d): ident = %@", __PRETTY_FUNCTION__, __LINE__, ident);
  return nil;
}

- (BOOL)handleObjectSelection:(id)fp8 userInfo:(id)fp12 {
  NSLog(@"[ENTRY] %s (%d): selection = %@, info = %@", __PRETTY_FUNCTION__, __LINE__, fp8, fp12);
  return YES;
}

- (id) applianceSpecificControllerForIdentifier:(id)arg1 args:(id)arg2 {
  NSLog(@"applianceSpecificControllerForIdentifier: %@ args: %@", arg1, arg2);
  return nil;
}

- (id)controllerForIdentifier:(id)identifier args:(id)args;
{
  NSLog(@"SELECTED: %@", identifier);

  id controller = [BRAlertController alertOfType:0
                                          titled:@"BRAlertController"
                                     primaryText:@"Show"
                                   secondaryText:identifier];

  return controller;
}

//- (id) controllerForIdentifier:(id)identifier args:(id)args
//{
	//id controller	= nil;
	
	//if ([identifier isEqualToString:HW_ID]) {
		//controller 	= [BRAlertController alertOfType:0 
												//titled:@"BRAlertController" 
										 //primaryText:@"Hello World" 
										 //secondaryText:@"Goodbye World"];
	//}
	//else if ([identifier isEqualToString:T60_ID]) {
		//controller	= [[[HelloWorldMainMenu alloc] init] autorelease];
	//}
	//else if ([identifier isEqualToString:INPUT_EVENTS_ID]) {
		//InputEventController* inputController = [[InputEventController alloc] init];

		//[inputController setPrimaryInfoText:@"Input Event Testing"];
		//[inputController setInitialTextEntryText:@""];
		//[inputController setShowUserEnteredText:NO];
		//[inputController setFootnoteText:@"Push some buttons..." withAttributes:nil];
		
		//controller = [inputController autorelease];
	//}
	//else if ([identifier isEqualToString:VIDEO_ID]) {
		//[[BRMediaPlayerManager singleton] presentMediaAsset:[[[SampleVideoAsset alloc] init] autorelease] options:nil];
	//}
	//else if ([identifier isEqualToString:EAGLCONTROL_ID]) {
		//EAGLControl* eaglCtrl = [[EAGLControl alloc] init];
		//[eaglCtrl startAnimation];
		//controller	= [BRController controllerWithContentControl:eaglCtrl];
		//[eaglCtrl release];
	//}
	//else if ([identifier isEqualToString:TEAPOT_ID]) {
		//GLGravityView* gravityView = [[GLGravityView alloc] init];
		//[gravityView startAnimation];
		
		//controller = [BRController controllerWithContentControl:gravityView];
		//[gravityView release];
	//}
	
	//return controller;
//}

@end

