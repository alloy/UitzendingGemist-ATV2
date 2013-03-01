#import "UZGPagesListController.h"

@implementation UZGPagesListController

- (id)initWithPageCount:(NSUInteger)pageCount
            currentPage:(NSUInteger)currentPage
                  title:(NSString *)title
               delegate:(id<UZGPagesListControllerDelegate>)delegate;
{
  if ((self = [super init])) {
    _pageCount = pageCount;
    _delegate = delegate;
    self.header.title = title;
    self.list.datasource = self;
    // TODO make this work by figuring out the after load callback
    self.list.selection = currentPage-1;
  }
  return self;
}

- (float)listVerticalOffset;
{
  return 34;
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

- (id)previewControlForItem:(long)row;
{
  return [self.delegate previewControlForDefaultAsset];
}

- (void)itemSelected:(long)row;
{
  [self.delegate pagesListController:self didSelectPage:row+1];
}


@end
