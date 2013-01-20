#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"

//#import "BRURLImageProxy.h"
//#import "BRMediaType.h"
//#import "BRImageLoader.h"

@interface UZGEpisodesListController ()
@property (retain) NSString *path;
@property (retain) NSArray *episodes;
@property (retain) NSDictionary *loadingEpisode;
@end

@implementation UZGEpisodesListController

- (void)dealloc;
{
  [_path release];
  [_episodes release];
  [_loadingEpisode release];
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

- (void)loadEpisode;
{
  NSString *path = self.loadingEpisode[@"path"];
  NSLog(@"FETCH EPISODE: %@", self.loadingEpisode);

  [[UitzendingGemistAPIClient sharedClient] episodeStreamSourcesForPath:path
                                                                success:^(id _, id episodeMediaAsset) {
    NSLog(@"Media asset URL: %@", [episodeMediaAsset mediaURL]);
    self.loadingEpisode = nil;
    [[BRMediaPlayerManager singleton] presentMediaAsset:episodeMediaAsset options:nil];
  }
                                                                failure:^(id _, NSError *error) {
                                                                          NSLog(@"ERROR: %@", error);
                                                                        }];
}

@end
