#import "BackRow.h"
#import "UZGPagesListController.h"

@class UZGPaginationData;

@interface UZGBaseListController : BRMediaMenuController <BRMenuListItemProvider, UZGPagesListControllerDelegate>

@property (nonatomic, strong) NSArray *assets;
@property (nonatomic, strong) NSString *realTitle;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger lastPage;

@property (readonly) BOOL hasMultiplePages;
@property (readonly) BOOL shouldDividerBeVisible;
@property (readonly) NSInteger dividerIndex;

- (void)fetchAssets;
- (void)selectedAsset:(long)row;
- (void)processPaginationData:(UZGPaginationData *)paginationData;
- (BOOL)isPaginationRow:(long *)row;
- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;

@end
