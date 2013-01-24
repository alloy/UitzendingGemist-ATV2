#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"
#import "UZGPlayedList.h"

//#import "BRURLImageProxy.h"
//#import "BRMediaType.h"
//#import "BRImageLoader.h"

#import "BRMediaPlayer.h"

@interface UZGEpisodesListController ()
@property (retain) NSString *path;
@property (retain) NSDictionary *loadingEpisode;
@property (retain) BRMediaPlayer *player;
@end

@implementation UZGEpisodesListController

- (void)dealloc;
{
  [_path release];
  [_loadingEpisode release];
  [_player release];
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
    NSString *path = episode[@"path"];
    UZGEpisodeProgressStatus status = [[UZGPlayedList sharedList] playedStatusForEpisodePath:path];
    switch (status) {
      case UZGEpisodeUnplayedStatus:
         [item addAccessoryOfType:BRUnplayedMenuItemAccessoryType];
         break;
      case UZGEpisodeUnplayedPartialStatus:
        [item addAccessoryOfType:BRUnplayedPartialMenuItemAccessoryType];
        break;
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
  [[UitzendingGemistAPIClient sharedClient] episodeStreamSourcesForPath:path
                                                                success:^(id _, UZGEpisodeMediaAsset *episodeMediaAsset) {
    self.loadingEpisode = nil;
    episodeMediaAsset.delegate = self;
    NSError *error = nil;
    self.player = [[BRMediaPlayerManager singleton] playerForMediaAsset:episodeMediaAsset error:&error];
    if (error) {
      NSLog(@"ERROR: %@", error);
    } else {
      [[BRMediaPlayerManager singleton] presentPlayer:self.player options:nil];
    }

    // TODO need to figure out how to reload the list entries when the video player
    // is closed and the view returns to this list, in which case the played status
    // accessory should be updated.
    [self.list reload];
  }
                                                                failure:^(id _, NSError *error) {
                                                                          NSLog(@"ERROR: %@", error);
                                                                        }];
}

- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episodeMediaAsset hasBeenPlayed:(BOOL)played;
{
  episodeMediaAsset.duration = (NSUInteger)roundf(self.player.duration);
}

@end
