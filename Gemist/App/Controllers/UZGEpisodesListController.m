#import "UZGEpisodesListController.h"
#import "UZGPlistStore.h"
#import "UZGShowMediaAsset.h"

//#import "BRURLImageProxy.h"
//#import "BRMediaType.h"
//#import "BRImageLoader.h"

#import "BRMediaPlayer.h"

@interface UZGEpisodesListController ()
@property (strong) UZGShowMediaAsset *show;
@property (strong) NSString *path;
@property (strong) UZGEpisodeMediaAsset *loadingEpisode;
@property (strong) BRMediaPlayer *player;
@end

@implementation UZGEpisodesListController


- (id)initWithShow:(UZGShowMediaAsset *)show;
{
  if ((self = [super init])) {
    _show = show;
    self.realTitle = _show.title;
    _path = _show.path;
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
      UZGEpisodeMediaAsset *episode = self.assets[row];
      if (episode.thumbnail) {
        BRImageAndSyncingPreviewController *controller = [BRImageAndSyncingPreviewController new];
        [controller setReflectionAmount:0.5];
        controller.image = episode.thumbnail;
        return controller;

      } else {
        [episode withThumbnail:^{ [self updatePreviewController]; }
                       failure:^(id _, NSError *error) { NSLog(@"ERROR: %@", error); }];
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
    return UZGLocalizedString(self.show.isBookmarked ? @"Remove from Favorites" : @"Add to Favorites");
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
    [self.show toggleBookmarked];
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

  if (row > 0) {
    // offset for bookmark item
    row -= 1;
    if (![self isPaginationRow:&row previous:NULL]) {
      UZGEpisodeMediaAsset *episode = self.assets[row];
      // TODO move to episode instance
      UZGEpisodeProgressStatus status = [[UZGPlistStore sharedStore] playedStatusForEpisodePath:episode.path];
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
- (void)selectedAsset:(long)row;
{
  self.loadingEpisode = self.assets[row];
  [self loadEpisode];
  [self.list reload];
}

- (void)fetchAssets;
{
  [super fetchAssets];
  [self.show episodesAtPage:self.currentPage
                    success:^(UZGPaginationData *data) { [self processPaginationData:data]; }
                    failure:^(id _, NSError *error) { NSLog(@"ERROR: %@", error); }];
}

- (void)loadEpisode;
{
  UZGEpisodeMediaAsset *episode = self.loadingEpisode;
  [episode withMediaURL:^{
    episode.delegate = self;

    NSError *error = nil;
    self.player = [[BRMediaPlayerManager singleton] playerForMediaAsset:episode error:&error];
    if (error) {
      NSLog(@"ERROR: %@", error);
    } else {
      [[BRMediaPlayerManager singleton] presentPlayer:self.player options:nil];
    }

    // Reload now so that if the user returns imediately the spinner accessory
    // is no longer shown.
    self.loadingEpisode = nil;
    [self.list reload];

  } failure:^(id _, NSError *error) {
    NSLog(@"ERROR: %@", error);
  }];
}

- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episode hasBeenPlayed:(BOOL)played;
{
  episode.duration = (NSUInteger)roundf(self.player.duration);
}

// Reload list to reflect any change in the episode’s progress status.
//
// TODO Using the -[BRMediaAsset setBookmarkTimeInSeconds:] callback for this
// delegate callback. There has to be a better way to get notifications from
// the player, because now we update the list everytime the user stops playback
// instead of only when the user will return to the list.
- (void)episodeMediaAssetDidStopPlayback:(UZGEpisodeMediaAsset *)episode;
{
  [self.list reload];
}

- (BOOL)brEventAction:(BREvent *)event;
{
  if (event.remoteAction == BREventOKButtonLongAction) {
    NSLog(@"TOGGLE PROGRESS STATUS");
    return YES;
  } else {
    return [super brEventAction:event];
  }
}

@end
