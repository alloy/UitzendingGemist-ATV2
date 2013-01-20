#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"

#import <objc/runtime.h>

@interface UZGEpisodesListController ()
@property (retain) NSString *path;
@property (retain) NSArray *episodes;
@property (retain) NSDictionary *loadingEpisode;
//@property (retain) BRWebControl *webControl;
@end

@implementation UZGEpisodesListController

- (void)dealloc;
{
  [_path release];
  [_episodes release];
  [_loadingEpisode release];
//  [_webControl release];
  [super dealloc];
}

- (id)initWithShowTitle:(NSString *)title path:(NSString *)path;
{
  if ((self = [super init])) {
    self.listTitle = title;
    _path = [path retain];
    _episodes = [NSArray new];
    self.list.datasource = self;
    [self fetchEpisodes];
  }
  return self;
}

- (BOOL)isLoadingEpisode;
{
  return self.loadingEpisode != nil;
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  return self.episodes.count;
}

// TODO no idea what this is for
- (NSString *)titleForRow:(long)row;
{
  return self.episodes[row][@"title"];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  NSDictionary *episode = self.episodes[row];
  BRMenuItem *item = [BRMenuItem new];
  item.text = episode[@"title"];
  BOOL selected = [self.loadingEpisode isEqual:episode];
  [item addAccessoryOfType:(selected ? 6 : 0)];
  return item;
}

// TODO Hmm, this doesn't stop it from being selected!
- (BOOL)rowSelectable:(long)row;
{
  // return !self.isLoadingEpisode;
  return YES;
}

// TODO disable interface so user can't selecte another episode.
- (void)itemSelected:(long)row;
{
  self.loadingEpisode = self.episodes[row];
  [self loadEpisode];
  [self.list reload];
}

- (void)fetchEpisodes;
{
  NSLog(@"FETCH EPISODES!");
  self.showSpinner = YES;

  [[UitzendingGemistAPIClient sharedClient] episodesOfShowAtPath:self.path
                                                            page:1
                                                         success:^(id _, id episodes) {
    NSLog(@"%@", episodes);
    self.episodes = episodes;
    self.showSpinner = NO;
    [self.list reload];
  }
                                                         failure:^(id _, NSError *error) {
                                                                   NSLog(@"ERROR: %@", error);
                                                                 }];
}

- (void)bundleDidLoad:(NSNotification *)n;
{
  NSLog(@"%@", n.userInfo);
}

- (void)loadEpisode;
{
  NSString *path = self.loadingEpisode[@"path"];
  NSLog(@"FETCH EPISODE: %@", self.loadingEpisode);

  // NSURLRequest *request = [[UitzendingGemistAPIClient sharedClient] requestWithMethod:@"GET" path:path parameters:nil];
  // NSLog(@"REQUEST: %@, %@", request, request.allHTTPHeaderFields);

  //NSBundle *couchSurferBundle = [NSBundle bundleWithPath:@"/Applications/AppleTV.app/Appliances/CouchSurfer.frappliance"];
  //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bundleDidLoad:) name:NSBundleDidLoadNotification object:couchSurferBundle];
  //NSLog(@"BUNDLE: %@", couchSurferBundle);
  //if ([couchSurferBundle load]) {
    //NSLog(@"LOADED");
  //}

  // Class XWebView = NSClassFromString(@"CouchSurferWebView");
  // id webControl = [NSClassFromString(@"CouchSurferWebView") webControl];
  // NSLog(@"WebView: %@", XWebView);
  // BRController *controller = [BRController controllerWithContentControl:];

  //Class XWebView = NSClassFromString(@"WebView");
  //NSLog(@"WebView: %@, %@", XWebView, [XWebView superclass]);

  // id webView = [[XWebView alloc] init];
  // id webView = [XWebView performSelector:@selector(alloc)];

  //int i=0;
  //unsigned int mc = 0;
  //Method * mlist = class_copyMethodList(object_getClass(webView), &mc);
  //NSLog(@"%d methods", mc);
  //for(i=0;i<mc;i++) {
    //NSLog(@"Method no #%d: %s", i, sel_getName(method_getName(mlist[i])));
  //}

  // NSMethodSignature *sig = [webView methodSignatureForSelector:@selector(initWithFrame:)];
  // NSLog(@"%@, arg type: %s", sig, [sig getArgumentTypeAtIndex:2]);

  // [webView _initWithArguments:nil];
  // [webView initWithFrame:CGRectMake(0, 0, 100, 100)];

  // id webView = [[XWebView performSelector:@selector(alloc)] performSelector:@selector(init)];
  // NSLog(@"%@", webView);
  // [webView _openNewWindowWithRequest:request];

  // self.webControl = [BRWebControl control];
  // NSLog(@"CONTROL: %@", self.webControl);
  //
  //self.webControl.delegate = self;
  //[self.webControl loadRequest:request];

  [[UitzendingGemistAPIClient sharedClient] episodeMediaAssetForPath:path
                                                             success:^(id _, id episodeMediaAsset) {
    NSLog(@"%@", episodeMediaAsset);
    // [[BRMediaPlayerManager singleton] presentMediaAsset:episodeMediaAsset options:nil];
  }
                                                            failure:^(id _, NSError *error) {
                                                                      NSLog(@"ERROR: %@", error);
                                                                    }];
}

//- (void)webControl:(id)control didFailLoadWithError:(id)error;
//{
  //NSLog(@"WEB CONTROL: %@, FAILED WITH ERROR: %@", control, error);
//}

//- (void)webControl:(id)control didReceiveTitle:(id)title;
//{
  //NSLog(@"WEB CONTROL: %@, DID RECEIVE TITLE: %@", control, title);
//}

//- (void)webControl:(id)control saveStateToHistoryItem:(id)historyItem;
//{
//}

//- (void)webControlDidFinishLoad:(id)webControl;
//{
  //NSLog(@"WEB CONTROL DID FINISH LOADING: %@", webControl);
//}

//- (void)webControlDidStartLoad:(id)webControl;
//{
  //NSLog(@"WEB CONTROL DID START LOADING: %@", webControl);
//}

@end
