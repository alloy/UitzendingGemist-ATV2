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

- (id)previewControlForItem:(long)row;
{
  if (row != 0) {
    // offset for bookmark item
    row -= 1;
    if (![self isPaginationRow:&row previous:NULL]) {
      NSDictionary *episode = self.listEntries[row];
      NSURL *thumbnailURL = episode[@"thumbnail"];
      if (thumbnailURL != (id)[NSNull null]) {
        BRImage *thumbnailImage = [BRImage imageWithURL:thumbnailURL];
        BRImageAndSyncingPreviewController *controller = [[BRImageAndSyncingPreviewController new] autorelease];
        [controller setReflectionAmount:0.5];
        controller.image = thumbnailImage;
        return controller;
      }
    }
  }
  return nil;
}

- (long)itemCount;
{
  return [super itemCount] + 1;
}

- (NSString *)titleForRow:(long)row;
{
  if (row == 0) {
    return @"Bookmark";
  } else {
    return [super titleForRow:row-1];
  }
}

- (BOOL)rowSelectable:(long)row;
{
  if (row == 0) {
    return YES;
  } else {
    return [super rowSelectable:row-1];
  }
}

- (void)itemSelected:(long)row;
{
  if (row == 0) {
    BOOL bookmarked = [[UZGPlayedList sharedList] hasBookmarkedShowForPath:self.path];
    [[UZGPlayedList sharedList] setHasBookmarkedShow:!bookmarked
                                             forPath:self.path
                                           withTitle:self.realTitle];
    [self.list reload];
  } else {
    [super itemSelected:row-1];
  }
}

- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;
{
  [super addDisclosureAccessoryToPaginationItem:item row:row-1];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  long realRow = row;
  BRMenuItem *item = [super itemForRow:realRow];

  if (row == 0) {
    if ([[UZGPlayedList sharedList] hasBookmarkedShowForPath:self.path]) {
      [item addAccessoryOfType:BRCheckmarkMenuItemAccessoryType];
    }

  } else {
    // offset for bookmark item
    row -= 1;
    if (![self isPaginationRow:&row previous:NULL]) {
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
    episodeMediaAsset.delegate = self;
    NSError *error = nil;
    self.player = [[BRMediaPlayerManager singleton] playerForMediaAsset:episodeMediaAsset error:&error];
    if (error) {
      NSLog(@"ERROR: %@", error);
    } else {
      [[BRMediaPlayerManager singleton] presentPlayer:self.player options:nil];
    }

    // Reload now so that if the user returns imediately the spinner accessory
    // is no longer shown.
    self.loadingEpisode = nil;
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

// Reload list to reflect any change in the episode’s progress status.
//
// TODO Using the -[BRMediaAsset setBookmarkTimeInSeconds:] callback for this
// delegate callback. There has to be a better way to get notifications from
// the player, because now we update the list everytime the user stops playback
// instead of only when the user will return to the list.
- (void)episodeMediaAssetDidStopPlayback:(UZGEpisodeMediaAsset *)episodeMediaAsset;
{
  [self.list reload];
}

@end
