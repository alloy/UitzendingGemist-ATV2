#import "UZGBaseListController.h"
#import "UZGPaginationData.h"
#import "UZGBaseMediaAsset.h"
#import "UZGMetadataPreviewControl.h"

@implementation UZGTopSectionMenuItem
@end

@interface UZGBaseListController ()
@property (strong) UZGTopSectionMenuItem *paginationMenuItem;
@end

@implementation UZGBaseListController

- (id)init;
{
  if ((self = [super init])) {
    _currentPage = 1;
    _lastPage = 0;
    _assets = [NSArray new];
    _topSectionItems = [NSMutableArray new];

    _paginationMenuItem = [UZGTopSectionMenuItem new];
    _paginationMenuItem.text = @"Other pages";
    [_paginationMenuItem addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
    [_topSectionItems addObject:_paginationMenuItem];

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
    _realTitle = realTitle;
    self.header.title = realTitle;
  }
}

- (void)fetchAssets;
{
  self.showSpinner = YES;
}

- (void)processPaginationData:(UZGPaginationData *)paginationData;
{
  self.assets = paginationData.entries;
  self.lastPage = paginationData.pageCount;
  self.showSpinner = NO;
  [self reloadListData];
}

- (BOOL)hasMultiplePages;
{
  return self.lastPage > 1;
}

- (NSArray *)visibleTopSectionItems;
{
  NSMutableArray *items = [NSMutableArray new];
  for (UZGTopSectionMenuItem *item in self.topSectionItems) {
    if (item.isVisible) [items addObject:item];
  }
  return [items copy];
}

- (float)listVerticalOffset;
{
  return self.hasMultiplePages ? 34 : 11;
}

- (NSInteger)dividerIndex;
{
  return self.visibleTopSectionItems.count;
}

- (void)reloadListData;
{
  self.header.title = self.realTitle;
  self.paginationMenuItem.isVisible = self.hasMultiplePages;

  if (self.hasMultiplePages) {
    self.header.subtitle = [NSString stringWithFormat:@"Page %d of %d", self.currentPage, self.lastPage];
    //self.listTitle = [NSString stringWithFormat:@"%@ (%d/%d)", self.realTitle, self.currentPage, self.lastPage];
  }

  [self.list removeDividers];
  NSInteger index = self.dividerIndex;
  if (index > 0) {
    [self.list addDividerAtIndex:index withLabel:nil];
  }

  [self.list reload];
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  return self.visibleTopSectionItems.count + self.assets.count;
}

// Needed for something besides being part of the list protocol?
- (NSString *)titleForRow:(long)row;
{
  return nil;
}

- (BRMenuItem *)itemForRow:(long)row;
{
  NSArray *topItems = self.visibleTopSectionItems;
  if (row < topItems.count) {
    return topItems[row];
  } else {
    return [self itemForAsset:self.assets[row - topItems.count]];
  }
}

- (id)previewControlForItem:(long)row;
{
  NSArray *topItems = self.visibleTopSectionItems;
  if (row < topItems.count) {
    return nil;
  } else {
    UZGBaseMediaAsset *asset = self.assets[row - topItems.count];
    return [[UZGMetadataPreviewControl alloc] initWithAsset:asset];
  }
}

- (BOOL)rowSelectable:(long)row;
{
  return YES;
}

- (void)itemSelected:(long)row;
{
  NSArray *topItems = self.visibleTopSectionItems;
  if (row < topItems.count) {
    [self selectedTopSectionItem:topItems[row]];
  } else {
    [self selectedAsset:self.assets[row - topItems.count]];
  }
}

#pragma mark - UZGPagesListControllerDelegate

- (void)pagesListController:(UZGPagesListController *)controller didSelectPage:(NSUInteger)page;
{
  [[self stack] removeController:controller];
  self.currentPage = page;
  self.assets = [NSArray array];
  [self reloadListData];
  [self fetchAssets];
}

#pragma mark - Public/subclass methods


- (BRMenuItem *)itemForAsset:(UZGBaseMediaAsset *)asset;
{
  BRMenuItem *item = [BRMenuItem new];
  item.text = asset.title;
  return item;
}

- (void)selectedAsset:(UZGBaseMediaAsset *)asset;
{
  NSAssert(NO, @"override!");
}

- (void)selectedTopSectionItem:(UZGTopSectionMenuItem *)item;
{
  if (item == self.paginationMenuItem) {
    [[self stack] pushController:[[UZGPagesListController alloc] initWithPageCount:self.lastPage
                                                                       currentPage:self.currentPage
                                                                          delegate:self]];
  }
}

@end
