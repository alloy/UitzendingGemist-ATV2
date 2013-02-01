#import "UZGBookmarksListController.h"
#import "UZGPlayedList.h"
#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"

@interface UZGBookmarksListController ()
@property (retain) NSMutableDictionary *bannerCache;
@property (retain) NSDictionary *bookmarks;
@property (retain) NSArray *bookmarkTitles;
@end

@implementation UZGBookmarksListController

- (void)dealloc;
{
  [_bannerCache release];
  [_bookmarks release];
  [_bookmarkTitles release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _bannerCache = [NSMutableDictionary new];
    _bookmarks = [[[UZGPlayedList sharedList] allBookmarks] retain];
    _bookmarkTitles = [[[_bookmarks allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] retain];
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
  BRMenuItem *item = [[BRMenuItem new] autorelease];
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
    BRImageAndSyncingPreviewController *controller = [[BRImageAndSyncingPreviewController new] autorelease];
    [controller setReflectionAmount:0.5];
    controller.image = bannerImage;
    return controller;

  } else {
    NSString *title = self.bookmarkTitles[row];
    NSString *path = self.bookmarks[title];
    [[UitzendingGemistAPIClient sharedClient] bannerForShowAtPath:path
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
  NSString *title = self.bookmarkTitles[row];
  NSString *path = self.bookmarks[title];
  UZGEpisodesListController *controller;
  controller = [[[UZGEpisodesListController alloc] initWithShowTitle:title
                                                                path:path] autorelease];
  [[self stack] pushController:controller];
}

@end
