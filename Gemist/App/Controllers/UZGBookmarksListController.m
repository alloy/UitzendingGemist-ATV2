#import "UZGBookmarksListController.h"
#import "UZGEpisodesListController.h"
#import "UZGClient.h"
#import "UZGShowMediaAsset.h"
#import "UZGMetadataPreviewControl.h"

@interface UZGBookmarksListController ()
@property (strong) NSArray *bookmarks;
@end

@implementation UZGBookmarksListController

- (instancetype)initWithContext:(NSManagedObjectContext *)context;
{
  if ((self = [super initWithContext:context])) {
    _bookmarks = [UZGShowMediaAsset favoritedShowsInContext:context];
    self.header.title = UZGLocalizedString(@"Favorites");
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
  return [(UZGShowMediaAsset *)self.bookmarks[row] title];
}

- (id)previewControlForItem:(long)row;
{
  return [[UZGMetadataPreviewControl alloc] initWithAsset:self.bookmarks[row]];
}

- (void)itemSelected:(long)row;
{
  UZGEpisodesListController *controller = [[UZGEpisodesListController alloc] initWithShow:self.bookmarks[row]];
  [[self stack] pushController:controller];
}

@end
