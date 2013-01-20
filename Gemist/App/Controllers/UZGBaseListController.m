#import "UZGBaseListController.h"

@interface UZGBaseListController ()

@end

@implementation UZGBaseListController

- (void)dealloc;
{
  [_realTitle release];
  [_listEntries release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _currentPage = 1;
    _lastPage = 0;
    _listEntries = [NSArray new];
    self.list.datasource = self;
    // Start in next tick, also gives subclass a chance to set the title.
    dispatch_async(dispatch_get_current_queue(), ^{
      [self fetchListEntries];
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

- (void)fetchListEntries;
{
  self.showSpinner = YES;
}

- (void)fetchedlistEntriesAndLastPage:(NSArray *)listEntriesAndLastPage;
{
  NSLog(@"%@", listEntriesAndLastPage);
  self.listEntries = listEntriesAndLastPage[0];
  self.lastPage = [listEntriesAndLastPage[1] unsignedIntegerValue];
  self.showSpinner = NO;
  [self reloadListData];
}

- (BOOL)showPreviousPageMenuItem;
{
  return self.currentPage > 1;
}

- (BOOL)showNextPageMenuItem;
{
  return (self.lastPage != self.currentPage);
}

// YES if previous, NO if next
- (BOOL)isPaginationRow:(long *)row previous:(BOOL *)previous;
{
  BOOL isPagination = NO;
  long r = *row;
  if (self.showPreviousPageMenuItem) {
    if (r == 0) {
      *previous = YES;
      isPagination = YES;
    } else if (self.showNextPageMenuItem) {
      if (r == 1) {
        *previous = NO;
        isPagination = YES;
      }
      r--;
    }
    r--;
  } else if (self.showNextPageMenuItem) {
    if (r == 0) {
      *previous = NO;
      isPagination = YES;
    }
    r--;
  }
  *row = r;
  return isPagination;
}

- (void)reloadListData;
{
  if (self.lastPage == 0) {
    self.listTitle = self.realTitle;
  } else {
    self.listTitle = [NSString stringWithFormat:@"%@ (%d/%d)", self.realTitle, self.currentPage, self.lastPage];
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
  NSUInteger count = self.listEntries.count;
  if (count == 0) return 0;

  if (self.showPreviousPageMenuItem) count++;
  if (self.showNextPageMenuItem) count++;
  return count;
}

// TODO no idea what this is for
- (NSString *)titleForRow:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    return previous ? @"Previous Page" : @"Next Page";
  } else {
    return self.listEntries[row][@"title"];
  }
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [BRMenuItem new];
  item.text = [self titleForRow:row];
  return item;
}

- (BOOL)rowSelectable:(long)selectable;
{
  return YES;
}

- (void)itemSelected:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    self.currentPage = self.currentPage + (previous ? -1 : +1);
    self.listEntries = [NSArray array];
    [self reloadListData];
    [self fetchListEntries];
  } else {
    [self listEntrySelected:row];
  }
}

- (void)listEntrySelected:(long)row;
{
  NSAssert(NO, @"override!");
}

@end
