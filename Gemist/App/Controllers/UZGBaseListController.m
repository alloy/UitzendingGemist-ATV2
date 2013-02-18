#import "UZGBaseListController.h"

@interface UZGBaseListController ()

@end

@implementation UZGBaseListController

- (void)dealloc;
{
  [_bannerCache release];
  [_realTitle release];
  [_assets release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _currentPage = 1;
    _lastPage = 0;
    _assets = [NSArray new];
    _bannerCache = [NSMutableDictionary new];
    self.list.datasource = self;
    // Start in next tick, also gives subclass a chance to set the title.
    dispatch_async(dispatch_get_current_queue(), ^{
      [self fetchAssets];
    });
  }
  return self;
}

- (void)setRealTitle:(NSString *)realTitle;
{
  if (![_realTitle isEqualToString:realTitle]) {
    _realTitle = [realTitle retain];
    self.listTitle = realTitle;
  }
}

- (void)fetchAssets;
{
  self.showSpinner = YES;
}

- (void)fetchedAssetsAndLastPage:(NSArray *)assetsAndLastPage;
{
  // NSLog(@"%@", assetsAndLastPage);
  self.assets = assetsAndLastPage[0];
  self.lastPage = [assetsAndLastPage[1] unsignedIntegerValue];
  self.showSpinner = NO;
  [self reloadListData];
}

- (BOOL)hasMultiplePages;
{
  return self.lastPage > 1;
}

- (BOOL)enablePreviousPageMenuItem;
{
  return self.currentPage > 1;
}

- (BOOL)enableNextPageMenuItem;
{
  return (self.lastPage != self.currentPage);
}

- (BOOL)isPaginationRow:(long *)row previous:(BOOL *)previous;
{
  if (!self.hasMultiplePages) {
    return NO;
  } else {
    BOOL isPaginationRow = NO;
    if (*row == 0) {
      if (previous != NULL) *previous = NO;
      isPaginationRow = YES;
    } else if (*row == 1) {
      if (previous != NULL) *previous = YES;
      isPaginationRow = YES;
    }
    // Always offset row
    *row = *row - 2;
    return isPaginationRow;
  }
}

- (void)reloadListData;
{
  if (self.hasMultiplePages) {
    self.listTitle = [NSString stringWithFormat:@"%@ (%d/%d)", self.realTitle, self.currentPage, self.lastPage];
  } else {
    self.listTitle = self.realTitle;
  }
  self.bannerCache = [[NSMutableDictionary new] autorelease];
  [self.list reload];
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  long count = self.assets.count;
  if (self.hasMultiplePages) count += 2;
  return count;
}

// TODO no idea what this is really for
- (NSString *)titleForRow:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    return UZGLocalizedString(previous ? @"Previous Page" : @"Next Page");
  }
  return [self.assets[row] title];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [[BRMenuItem new] autorelease];
  item.text = [self titleForRow:row];
  item.acceptsFocus = [self rowSelectable:row];
  item.dimmed = !item.acceptsFocus;
  [self addDisclosureAccessoryToPaginationItem:item row:row];
  return item;
}

- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;
{
  if ([self isPaginationRow:&row previous:NULL]) {
    [item addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
  }
}

// TODO no idea what this is really for
- (BOOL)rowSelectable:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    if (previous) {
      return self.enablePreviousPageMenuItem;
    } else {
      return self.enableNextPageMenuItem;
    }
  }
  return YES;
}

- (void)itemSelected:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    self.currentPage = self.currentPage + (previous ? -1 : +1);
    self.assets = [NSArray array];
    [self reloadListData];
    [self fetchAssets];
  } else {
    [self selectedAsset:row];
  }
}

- (void)selectedAsset:(long)row;
{
  NSAssert(NO, @"override!");
}

@end
