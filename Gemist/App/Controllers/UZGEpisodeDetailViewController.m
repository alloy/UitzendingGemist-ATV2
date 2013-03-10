#import "UZGEpisodeDetailViewController.h"


@interface UZGButtonControl : BRButtonControl
@property (copy) dispatch_block_t performAction;
@end

@implementation UZGButtonControl

- (BOOL)brEventAction:(BREvent *)event;
{
  if (event.value == 1 && event.remoteAction == BREventOKButtonAction) {
    self.performAction();
    return YES;
  }
  return [super brEventAction:event];
}

@end


// TODO need to import this from class-dump
@protocol ATVItemDetailView_HiddenInterface

@property (assign) int displayMode;

@property (strong) id mainImageProxy;
@property (strong) NSString *mainImageText;
@property (assign) int mainImageStyle;

@property (strong) BRMetadataTitleControl *titleControl;

@property (strong) NSString *summary;
@property (assign) float metadataWidth;

@property (strong) BRTableView *table;

@property (strong) BRMediaShelfView *bottomShelf;
@property (strong) BRMediaShelfView *centerShelf;

@end

@interface UZGEpisodeDetailViewController ()
@property (strong) BRControl<ATVItemDetailView_HiddenInterface> *detailView;
@property (strong) BRMediaPlayer *player;
@end

@implementation UZGEpisodeDetailViewController

- (instancetype)initWithEpisode:(UZGEpisodeMediaAsset *)episode;
{
  if ((self = [super init])) {
    _episode = episode;
    _detailView = [NSClassFromString(@"ATVItemDetailView") new];

    // Adds margin on left side
    _detailView.mainImageStyle = 1;
    _detailView.mainImageProxy = self.episode.imageProxy;
    // _detailView.mainImageText = @"IMAGE CAPTION";

    _detailView.titleControl.title = self.episode.showTitle;
    _detailView.titleControl.titleSubtext = self.episode.title;

    _detailView.summary = self.episode.mediaSummary;

    //_detailView.table.delegate = self;
    //_detailView.table.dataSource = self;

    BRMediaShelfView *centerShelf = [BRMediaShelfView new];
    _detailView.centerShelf = centerShelf;
    centerShelf.centered = YES;
    centerShelf.delegate = self;
    centerShelf.dataSource = self;
    // Need to tell it this first, which is rather weird as it could just call
    // the data source method...
    centerShelf.columnCount = [self mediaShelf:centerShelf numberOfColumnsInSection:0];

    [self addControl:_detailView];
    self.focusedControl = _detailView;
  }
  return self;
}

// TODO
- (void)handleError:(NSError *)error;
{
  NSLog(@"ERROR: %@", error);
}

- (void)layoutSubcontrols;
{
  [super layoutSubcontrols];
  self.detailView.frame = self.frame;
}

- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episode hasBeenPlayed:(BOOL)played;
{
  episode.duration = (NSUInteger)roundf(self.player.duration);
}

#pragma mark BRMediaShelfView delegate / dataSource

- (NSIndexPath *)mediaShelf:(id)shelfView indexPathForItemID:(NSString *)ID;
{
  NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, shelfView, ID);
  return nil;
}

- (id)mediaShelf:(id)shelfView itemAtIndexPath:(NSIndexPath *)indexPath;
{
  // NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, shelfView, indexPath);
  UZGButtonControl *button = [UZGButtonControl actionButtonWithImage:[[BRThemeInfo sharedTheme] playActionImage]
                                                            subtitle:@"Play" // TODO is this localized?
                                                               badge:nil];
  button.performAction = ^{
    NSLog(@"Play episode");
    [self.episode withMediaURL:^{
      self.episode.delegate = self;
      NSError *error = nil;
      self.player = [[BRMediaPlayerManager singleton] playerForMediaAsset:self.episode error:&error];
      if (error) {
        [self handleError:error];
      } else {
        [[BRMediaPlayerManager singleton] presentPlayer:self.player options:nil];
      }
    } failure:^(id _, NSError *error) { [self handleError:error]; }];
  };
  return button;
}

- (NSString *)mediaShelf:(id)shelfView itemIDForIndexPath:(NSIndexPath *)indexPath;
{
  NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, shelfView, indexPath);
  return nil;
}

- (long)numberOfSectionsInMediaShelf:(id)shelfView;
{
  // NSLog(@"%s - %@", __PRETTY_FUNCTION__, shelfView);
  return 1;
}

- (long)mediaShelf:(id)shelfView numberOfColumnsInSection:(long)section;
{
  // NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, shelfView, section);
  return 1;
}

- (id)mediaShelf:(id)shelfView sectionHeaderForSection:(long)section;
{
  // NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, shelfView, section);
  return nil;
}

- (id)mediaShelf:(id)shelfView titleForSectionAtIndex:(long)section;
{
  // NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, shelfView, section);
  return nil;
}

//#pragma mark BRTableView delegate / dataSource

//- (float)headerHeightForTableView:(id)tableView;
//{
  //NSLog(@"%s - %@", __PRETTY_FUNCTION__, tableView);
  //return 20;
//}

//- (long)numberOfColumnsInTableView:(id)tableView;
//{
  //NSLog(@"%s - %@", __PRETTY_FUNCTION__, tableView);
  //return 1;
//}

//- (long)numberOfHeaderColumnsInTableView:(id)tableView;
//{
  //NSLog(@"%s - %@", __PRETTY_FUNCTION__, tableView);
  //return 1;
//}

//- (long)numberOfRowsInTableView:(id)tableView;
//{
  //NSLog(@"%s - %@", __PRETTY_FUNCTION__, tableView);
  //return 1;
//}

//- (id)tableView:(id)tableView headerForColumn:(long)column;
//{
  //NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, tableView, column);
  //return nil;
//}

//- (float)tableView:(id)tableView heightForRow:(long)row;
//{
  //NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, tableView, row);
  //return 20;
//}

//- (id)tableView:(id)tableView itemForRow:(long)row inColumn:(long)column;
//{
  //NSLog(@"%s - %@, %d, %d", __PRETTY_FUNCTION__, tableView, row, column);
  //return nil;
//}

//- (float)tableView:(id)tableView widthForColumn:(long)column;
//{
  //NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, tableView, column);
  //return 100;
//}

//- (float)tableView:(id)tableView widthForHeaderColumn:(long)column;
//{
  //NSLog(@"%s - %@, %d", __PRETTY_FUNCTION__, tableView, column);
  //return 100;
//}

@end
