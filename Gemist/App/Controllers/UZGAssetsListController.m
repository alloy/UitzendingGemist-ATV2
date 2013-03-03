#import "UZGAssetsListController.h"
#import "UZGPaginationData.h"
#import "UZGBaseMediaAsset.h"
#import "UZGMetadataPreviewControl.h"

@implementation UZGTopSectionMenuItem
@end

@interface UZGAssetsListController ()
@property (strong) UZGTopSectionMenuItem *paginationMenuItem;
@end

@implementation UZGAssetsListController

- (id)init;
{
  if ((self = [super init])) {
    _currentPage = 1;
    _lastPage = 0;
    _assets = [NSArray new];
    _topSectionItems = [NSMutableArray new];

    // TODO I would love to set this immediately, as it makes the UI seem to
    // flicker less. However, I have not yet found out how to make sure the
    // subtitle label resizes after changing it, leading to it being cutoff
    // when the page count is longer than one digit.
    //
    // E.g.: 'Page 1 of 17' is displayed as 'Page 1 of...'
    //
    // self.header.subtitle = @"Page 1 of 1";
    // self.header.subtitle = @"";

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

- (void)setCurrentPage:(NSUInteger)page;
{
  if (_currentPage != page) {
    _currentPage = page;
    [self fetchAssetsAndReload];
  }
}

- (void)fetchAssets;
{
  self.showSpinner = YES;
}

- (void)fetchAssetsAndReload;
{
  self.assets = [NSArray new];
  [self reloadListData];
  [self fetchAssets];
}

- (void)handleError:(NSError *)error;
{
  BRAlertController *controller = [BRAlertController alertForError:error];
  controller.primaryText = error.localizedDescription;
  controller.secondaryText = [NSString stringWithFormat:@"(%@ - %ld)", error.domain, (long)error.code];
  [[self stack] pushController:controller];
  self.showSpinner = NO;
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
  return 34;
}

- (NSInteger)dividerIndex;
{
  return self.visibleTopSectionItems.count;
}

- (void)reloadListData;
{
  self.header.title = self.realTitle;
  self.header.subtitle = [NSString stringWithFormat:@"Page %d of %d", self.currentPage, self.lastPage];

  self.paginationMenuItem.isVisible = self.hasMultiplePages;

  [self.list removeDividers];
  NSInteger index = self.dividerIndex;
  if (index > 0) {
    [self.list addDividerAtIndex:index withLabel:nil];
  }

  // TODO use this instead?
  // [self refreshControllerForModelUpdate];
  [self.list reload];
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  if (self.showSpinner) {
    return 0;
  } else {
    return self.visibleTopSectionItems.count + self.assets.count;
  }
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
    return [self previewControlForDefaultAsset];
  } else {
    UZGBaseMediaAsset *asset = self.assets[row - topItems.count];
    return [[UZGMetadataPreviewControl alloc] initWithAsset:asset];
  }
  return nil;
}

- (BRControl *)previewControlForDefaultAsset;
{
  if (self.defaultAsset) {
    // Only show banner.
    BRCoverArtPreviewControl *control = [BRCoverArtPreviewControl new];
    [control setImageProxy:self.defaultAsset.imageProxy];
    return control;
  }
  return nil;
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

// Move to previouw/next page with left/right button and wrap around.
- (BOOL)brEventAction:(BREvent *)event;
{
  if (event.value == 1 && self.hasMultiplePages) {
    if (event.remoteAction == BREventLeftButtonAction) {
      self.currentPage = self.currentPage == 1 ? self.lastPage : self.currentPage-1;
      return YES;
    } else if (event.remoteAction == BREventRightButtonAction) {
      self.currentPage = self.currentPage == self.lastPage ? 1 : self.currentPage+1;
      return YES;
    }
  }
  return [super brEventAction:event];
}

#pragma mark - UZGPagesListControllerDelegate

- (void)pagesListController:(UZGPagesListController *)controller didSelectPage:(NSUInteger)page;
{
  [[self stack] removeController:controller];
  if (page != self.currentPage) {
    self.currentPage = page;
  }
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
                                                                             title:self.realTitle
                                                                          delegate:self]];
  }
}

@end
