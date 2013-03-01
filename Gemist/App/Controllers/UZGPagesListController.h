#import "BackRow.h"

@class UZGPagesListController;

@protocol UZGPagesListControllerDelegate <NSObject>
- (BRControl *)previewControlForDefaultAsset;
- (void)pagesListController:(UZGPagesListController *)controller didSelectPage:(NSUInteger)page;
@end

@interface UZGPagesListController : BRMediaMenuController

@property (readonly) NSUInteger pageCount;
// @property (readonly) NSUInteger currentPage;

@property (weak) id<UZGPagesListControllerDelegate> delegate;

- (id)initWithPageCount:(NSUInteger)pageCount
            currentPage:(NSUInteger)currentPage
                  title:(NSString *)title
               delegate:(id<UZGPagesListControllerDelegate>)delegate;

@end
