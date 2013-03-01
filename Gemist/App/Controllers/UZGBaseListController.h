#import "BackRow.h"
#import "UZGPagesListController.h"

@class UZGPaginationData, UZGBaseMediaAsset;

@interface UZGTopSectionMenuItem : BRMenuItem
@property (assign) BOOL isVisible;
@end

@interface UZGBaseListController : BRMediaMenuController <BRMenuListItemProvider, UZGPagesListControllerDelegate>

@property (nonatomic, strong) NSMutableArray *topSectionItems;
@property (nonatomic, strong) NSArray *assets;
@property (nonatomic, strong) NSString *realTitle;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger lastPage;

@property (readonly) BOOL hasMultiplePages;
@property (readonly) NSInteger dividerIndex;

- (BRMenuItem *)itemForAsset:(UZGBaseMediaAsset *)asset;
- (void)selectedAsset:(UZGBaseMediaAsset *)asset;
- (void)selectedTopSectionItem:(UZGTopSectionMenuItem *)item;

- (void)fetchAssets;
- (void)processPaginationData:(UZGPaginationData *)paginationData;

@end
