#import "UZGPagesListController.h"

@interface UZGPagesListController ()

@end

@implementation UZGPagesListController

- (id)initWithPageCount:(NSUInteger)pageCount
            currentPage:(NSUInteger)currentPage
               delegate:(id<UZGPagesListControllerDelegate>)delegate;
{
  if ((self = [super init])) {
    _pageCount = pageCount;
    _delegate = delegate;
    self.list.datasource = self;
    // TODO make this work by figuring out the after load callback
    self.list.selection = currentPage-1;
  }
  return self;
}

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  return self.pageCount;
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [BRMenuItem new];
  item.text = [self titleForRow:row];
  return item;
}

- (BOOL)rowSelectable:(long)row;
{
  return YES;
}

- (NSString *)titleForRow:(long)row;
{
  return [NSString stringWithFormat:@"Page %ld", row+1];
}

// TODO return show/episode asset
- (id)previewControlForItem:(long)row;
{
  // return [[UZGMetadataPreviewControl alloc] initWithAsset:self.bookmarks[row]];
  return nil;
}

- (void)itemSelected:(long)row;
{
  NSLog(@"Selected page: %ld", row+1);
  [self.delegate pagesListController:self didSelectPage:row+1];
}


@end
