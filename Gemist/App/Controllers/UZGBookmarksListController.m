#import "UZGBookmarksListController.h"
#import "UZGPlistStore.h"
#import "UZGEpisodesListController.h"
#import "UZGClient.h"
#import "UZGShowMediaAsset.h"

@interface UZGBookmarksListController ()
@property (strong) NSArray *bookmarks;
@end

@implementation UZGBookmarksListController


- (id)init;
{
  if ((self = [super init])) {
    _bookmarks = [[UZGPlistStore sharedStore] allBookmarkedShows];
    self.list.datasource = self;
  }
  return self;
}

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  return self.bookmarks.count;
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [BRMenuItem new];
  item.text = [self titleForRow:row];
  [item addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
  return item;
}

- (BOOL)rowSelectable:(long)row;
{
  return YES;
}

// TODO what is this used for?
- (NSString *)titleForRow:(long)row;
{
  return [self.bookmarks[row] title];
}

- (id)previewControlForItem:(long)row;
{
  UZGShowMediaAsset *show = self.bookmarks[row];
  if (show.thumbnail) {
    BRImageAndSyncingPreviewController *controller = [BRImageAndSyncingPreviewController new];
    [controller setReflectionAmount:0.5];
    controller.image = show.thumbnail;
    return controller;

  } else {
    if (show.previewURL) {
      [show withThumbnail:^{ [self updatePreviewController]; }
                  failure:^(id _, NSError *error) { NSLog(@"ERROR: %@", error); }];
    }
  }
  return nil;
}

- (void)itemSelected:(long)row;
{
  UZGEpisodesListController *controller;
  controller = [[UZGEpisodesListController alloc] initWithShow:self.bookmarks[row]];
  [[self stack] pushController:controller];
}

@end
