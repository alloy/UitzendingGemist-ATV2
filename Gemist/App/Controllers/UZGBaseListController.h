#import "BackRow.h"

@class UZGPaginationData;

@interface UZGBaseListController : BRMediaMenuController <BRMenuListItemProvider>

@property (nonatomic, strong) NSArray *assets;
@property (nonatomic, strong) NSString *realTitle;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger lastPage;
@property (strong) NSMutableDictionary *bannerCache;

- (void)fetchAssets;
- (void)selectedAsset:(long)row;
- (void)processPaginationData:(UZGPaginationData *)paginationData;
- (BOOL)isPaginationRow:(long *)row previous:(BOOL *)previous;
- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;

@end
