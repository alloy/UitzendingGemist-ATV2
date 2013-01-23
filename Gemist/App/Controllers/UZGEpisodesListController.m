#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"
#import "UZGPlayedList.h"

//#import "BRURLImageProxy.h"
//#import "BRMediaType.h"
//#import "BRImageLoader.h"

@interface UZGEpisodesListController ()
@property (retain) NSString *path;
@property (retain) NSDictionary *loadingEpisode;
@end

@implementation UZGEpisodesListController

- (void)dealloc;
{
  [_path release];
  [_loadingEpisode release];
  [super dealloc];
}

- (id)initWithShowTitle:(NSString *)title path:(NSString *)path;
{
  if ((self = [super init])) {
    self.realTitle = title;
    _path = [path retain];
  }
  return self;
}

- (BOOL)isLoadingEpisode;
{
  return self.loadingEpisode != nil;
}

- (BRMenuItem *)itemForRow:(long)row;
{
  long realRow = row;
  BRMenuItem *item = [super itemForRow:realRow];
  BOOL previous = NO;
  if (![self isPaginationRow:&row previous:&previous]) {
    NSDictionary *episode = self.listEntries[row];
    if (![[UZGPlayedList sharedList] playedEpisodeForPath:episode[@"path"]]) {
      [item addAccessoryOfType:BRUnplayedMenuItemAccessoryType];
    }
    if ([self.loadingEpisode isEqual:episode]) {
      [item addAccessoryOfType:BRSpinnerMenuItemAccessoryType];
    }
  }
  return item;
}

// TODO Hmm, this doesn't stop it from being selected!
// - (BOOL)rowSelectable:(long)row;
// {
  // return !self.isLoadingEpisode;
// }

// TODO disable interface so user can't selecte another episode.
- (void)listEntrySelected:(long)row;
{
  self.loadingEpisode = self.listEntries[row];
  [self loadEpisode];
  [self.list reload];
}

- (void)fetchListEntries;
{
  [super fetchListEntries];
  [[UitzendingGemistAPIClient sharedClient] episodesOfShowAtPath:self.path
                                                            page:self.currentPage
                                                         success:^(id _, id episodesAndLastPage) {
    [self fetchedlistEntriesAndLastPage:episodesAndLastPage];
  }
                                                         failure:^(id _, NSError *error) {
                                                                   NSLog(@"ERROR: %@", error);
                                                                 }];
}

- (void)loadEpisode;
{
  NSString *path = self.loadingEpisode[@"path"];
  // NSLog(@"FETCH EPISODE: %@", self.loadingEpisode);

  [[UitzendingGemistAPIClient sharedClient] episodeStreamSourcesForPath:path
                                                                success:^(id _, id episodeMediaAsset) {
    // NSLog(@"Media asset URL: %@", [episodeMediaAsset mediaURL]);
    self.loadingEpisode = nil;
    [[BRMediaPlayerManager singleton] presentMediaAsset:episodeMediaAsset options:nil];
    // TODO need to figure out how to reload the list entries when the video player
    // is closed and the view returns to this list, in which case the played status
    // accessory should be updated.
    [self.list reload];
  }
                                                                failure:^(id _, NSError *error) {
                                                                          NSLog(@"ERROR: %@", error);
                                                                        }];
}

@end
