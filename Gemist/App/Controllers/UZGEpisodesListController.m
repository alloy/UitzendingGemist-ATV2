#import "UZGEpisodesListController.h"
#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"

//#import "BRURLImageProxy.h"
//#import "BRMediaType.h"
//#import "BRImageLoader.h"

@interface UZGEpisodesListController ()
@property (strong) NSString *path;
@property (strong) UZGEpisodeMediaAsset *loadingEpisode;
@property (strong) BRMediaPlayer *player;
@property (strong) UZGTopSectionMenuItem *favoritesMenuItem;
@end

@implementation UZGEpisodesListController

- (id)initWithShow:(UZGShowMediaAsset *)show context:(NSManagedObjectContext *)context;
{
  if ((self = [super initWithContext:context])) {
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

  switch (episode.progressStatus) {
    case UZGEpisodeUnplayedStatus:
      [item addAccessoryOfType:BRUnplayedMenuItemAccessoryType];
      break;
    case UZGEpisodeUnplayedPartialStatus:
      [item addAccessoryOfType:BRUnplayedPartialMenuItemAccessoryType];
      break;
    case UZGEpisodePlayedStatus:
      break;
  }

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
                    context:self.managedObjectContext
                    success:^(UZGPaginationData *data) { [self processPaginationData:data]; }
                    failure:^(id _, NSError *error) { [self handleError:error]; }];
}

- (void)loadEpisode;
{
  UZGEpisodeMediaAsset *episode = self.loadingEpisode;
  [episode withMediaURL:^{
    [[BRMediaPlayerManager singleton] presentMediaAsset:episode options:nil];
    BRController *playerController = [[BRMediaPlayerManager singleton] _presentedPlayerController];
    playerController.wasPoppedBlock = ^{
      if (self.managedObjectContext.hasChanges) {
        // TODO this does not work...
        NSLog(@"THERE ARE CHANGES, SAVE!");
        [self.managedObjectContext recursiveSave];
      }
      self.loadingEpisode = nil;
      [self.list reload];
    };
  } failure:^(id _, NSError *error) { [self handleError:error]; }];
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
