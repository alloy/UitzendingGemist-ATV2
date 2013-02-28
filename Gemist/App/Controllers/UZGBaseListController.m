#import "UZGBaseListController.h"
#import "UZGPaginationData.h"
#import "UZGBaseMediaAsset.h"

@interface UZGBaseListController ()

@end

@implementation UZGBaseListController


- (id)init;
{
  if ((self = [super init])) {
    _currentPage = 1;
    _lastPage = 0;
    _assets = [NSArray new];
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
    // self.listTitle = realTitle;

    //self.title = @"title";
    //self.label = @"label";
    //self.primaryInfoText = @"primary";
    //self.secondaryInfoText = @"secondary";

    // self.header.title.attributedString = [[NSAttributedString alloc] initWithString:@"title"];
    // self.header.subtitle.attributedString = [[NSAttributedString alloc] initWithString:@"subtitle"];

    self.header.title = @"title";
    //self.header.subtitle = @"subtitle";
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

- (BOOL)isPaginationRow:(long *)row;
{
  if (!self.hasMultiplePages) {
    return NO;
  } else {
    BOOL isPaginationRow = *row == 0;
    // Offset row
    *row = *row - 1;
    return isPaginationRow;
  }
}

- (float)listVerticalOffset;
{
  return self.hasMultiplePages ? 34 : 11;
}

- (BOOL)shouldDividerBeVisible;
{
  return self.hasMultiplePages;
}

- (NSInteger)dividerIndex;
{
  return 1;
}

- (void)reloadListData;
{
  self.header.title = self.realTitle;
  if (self.hasMultiplePages) {
    self.header.subtitle = [NSString stringWithFormat:@"Page %d of %d", self.currentPage, self.lastPage];
    //self.listTitle = [NSString stringWithFormat:@"%@ (%d/%d)", self.realTitle, self.currentPage, self.lastPage];
  }

  self.list.firstDividerVisible = self.shouldDividerBeVisible;
  if (self.shouldDividerBeVisible) {
    [self.list removeDividers];
    [self.list addDividerAtIndex:self.dividerIndex withLabel:nil];
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
  long count = self.assets.count;
  if (self.hasMultiplePages) count += 1;
  return count;
}

// TODO no idea what this is really for
- (NSString *)titleForRow:(long)row;
{
  if ([self isPaginationRow:&row]) {
    // TODO
    // return UZGLocalizedString(@"Page %d of %d", self.currentPage, self.lastPage);
    return @"Other pages";
  }
  return [(UZGBaseMediaAsset *)self.assets[row] title];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [BRMenuItem new];
  item.text = [self titleForRow:row];
  item.acceptsFocus = [self rowSelectable:row];
  item.dimmed = !item.acceptsFocus;
  [self addDisclosureAccessoryToPaginationItem:item row:row];
  //if (![self isPaginationRow:&row]) {
    //item.leftMargin += 10;
  //}
  return item;
}

- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;
{
  if ([self isPaginationRow:&row]) {
    [item addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
  }
}

- (BOOL)rowSelectable:(long)row;
{
  return YES;
}

- (void)itemSelected:(long)row;
{
  if ([self isPaginationRow:&row]) {
    NSLog(@"Load pagination controller!");
    //self.currentPage = self.currentPage + (previous ? -1 : +1);
    //self.assets = [NSArray array];
    //[self reloadListData];
    //[self fetchAssets];
  } else {
    [self selectedAsset:row];
  }
}

- (void)selectedAsset:(long)row;
{
  NSAssert(NO, @"override!");
}

@end
