#import "UZGEpisodesListController.h"
#import "UZGShowMediaAsset.h"

//#import "BRURLImageProxy.h"
//#import "BRMediaType.h"
//#import "BRImageLoader.h"

#import "BRMediaPlayer.h"

@interface UZGEpisodesListController ()
@property (strong) NSString *path;
@property (strong) UZGEpisodeMediaAsset *loadingEpisode;
@property (strong) BRMediaPlayer *player;
@property (strong) UZGTopSectionMenuItem *favoritesMenuItem;
@end

@implementation UZGEpisodesListController


- (id)initWithShow:(UZGShowMediaAsset *)show;
{
  if ((self = [super init])) {
    self.defaultAsset = show;

    self.realTitle = show.title;
    _path = show.path;

    _favoritesMenuItem = [UZGTopSectionMenuItem new];
    _favoritesMenuItem.isVisible = YES;
    _favoritesMenuItem.text = self.favoritesMenuItemTitle;
    [self.topSectionItems addObject:_favoritesMenuItem];
  }
  return self;
}

- (UZGShowMediaAsset *)show;
{
  return (UZGShowMediaAsset *)self.defaultAsset;
}

- (void)handleError:(NSError *)error;
{
  [super handleError:error];
  self.loadingEpisode = nil;
  [self.list reload];
}

- (BOOL)isLoadingEpisode;
{
  return self.loadingEpisode != nil;
}

- (NSString *)favoritesMenuItemTitle;
{
  return UZGLocalizedString(self.show.isBookmarked ? @"Remove from Favorites" : @"Add to Favorites");
}

- (BRMenuItem *)itemForAsset:(UZGEpisodeMediaAsset *)episode;
{
  BRMenuItem *item = [super itemForAsset:episode];

  // TODO
  //UZGEpisodeProgressStatus status = [[UZGPlistStore sharedStore] playedStatusForEpisodePath:episode.path];
  //switch (status) {
    //case UZGEpisodeUnplayedStatus:
       //[item addAccessoryOfType:BRUnplayedMenuItemAccessoryType];
       //break;
    //case UZGEpisodeUnplayedPartialStatus:
      //[item addAccessoryOfType:BRUnplayedPartialMenuItemAccessoryType];
      //break;
  //}

  if (self.loadingEpisode && [self.loadingEpisode.path isEqualToString:episode.path]) {
    [item addAccessoryOfType:BRSpinnerMenuItemAccessoryType];
  }
  return item;
}

// TODO disable interface so user can't selecte another episode.
- (void)selectedAsset:(UZGEpisodeMediaAsset *)episode;
{
  self.loadingEpisode = episode;
  [self loadEpisode];
  [self.list reload];
}

- (void)selectedTopSectionItem:(UZGTopSectionMenuItem *)item;
{
  if (item == self.favoritesMenuItem) {
    [self.show toggleBookmarked];
    self.favoritesMenuItem.text = self.favoritesMenuItemTitle;
    [self.list reload];
  } else {
    [super selectedTopSectionItem:item];
  }
}

// TODO Hmm, this doesn't stop it from being selected!
// - (BOOL)rowSelectable:(long)row;
// {
  // return !self.isLoadingEpisode;
// }

- (void)fetchAssets;
{
  [super fetchAssets];
  [self.show episodesAtPage:self.currentPage
                    success:^(UZGPaginationData *data) { [self processPaginationData:data]; }
                    failure:^(id _, NSError *error) { [self handleError:error]; }];
}

- (void)loadEpisode;
{
  UZGEpisodeMediaAsset *episode = self.loadingEpisode;
  [episode withMediaURL:^{
    episode.delegate = self;

    NSError *error = nil;
    self.player = [[BRMediaPlayerManager singleton] playerForMediaAsset:episode error:&error];
    if (error) {
      [self handleError:error];
    } else {
      [[BRMediaPlayerManager singleton] presentPlayer:self.player options:nil];
    }

    // Reload now so that if the user returns imediately the spinner accessory
    // is no longer shown.
    self.loadingEpisode = nil;
    [self.list reload];

  } failure:^(id _, NSError *error) { [self handleError:error]; }];
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

// TODO toggle progress status
//
//- (BOOL)brEventAction:(BREvent *)event;
//{
  //if (event.remoteAction == BREventOKButtonLongAction) {
    //NSLog(@"TOGGLE PROGRESS STATUS");
    //return YES;
  //} else {
    //return [super brEventAction:event];
  //}
//}

@end
