#import "UZGBookmarksListController.h"
#import "UZGPlayedList.h"
#import "UZGEpisodesListController.h"
#import "UZGClient.h"
#import "UZGShowMediaAsset.h"

@interface UZGBookmarksListController ()
@property (strong) NSMutableDictionary *bannerCache;
@property (strong) NSDictionary *bookmarks;
@property (strong) NSArray *bookmarkTitles;
@end

@implementation UZGBookmarksListController


- (id)init;
{
  if ((self = [super init])) {
    _bannerCache = [NSMutableDictionary new];
    _bookmarks = [[UZGPlayedList sharedList] allBookmarks];
    _bookmarkTitles = [[_bookmarks allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
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
  return self.bookmarkTitles.count;
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
  return self.bookmarkTitles[row];
}

- (id)previewControlForItem:(long)row;
{
  BRImage *bannerImage = self.bannerCache[@(row)];
  if (bannerImage) {
    BRImageAndSyncingPreviewController *controller = [BRImageAndSyncingPreviewController new];
    [controller setReflectionAmount:0.5];
    controller.image = bannerImage;
    return controller;

  } else {
    NSString *title = self.bookmarkTitles[row];
    NSString *path = self.bookmarks[title];
    [[UZGClient sharedClient] bannerForShowAtPath:path
                                                          success:^(id _, id bannerImage) {
      self.bannerCache[@(row)] = bannerImage;
      [self updatePreviewController];
    }
                                                          failure:^(id _, NSError *error) {
                                                                      NSLog(@"ERROR: %@", error);
                                                                  }];
  }
  return nil;
}

- (void)itemSelected:(long)row;
{
  UZGShowMediaAsset *show = [UZGShowMediaAsset new];
  show.title = self.bookmarkTitles[row];
  show.path = self.bookmarks[show.title];

  UZGEpisodesListController *controller;
  controller = [[UZGEpisodesListController alloc] initWithShow:show];
  [[self stack] pushController:controller];
}

@end
