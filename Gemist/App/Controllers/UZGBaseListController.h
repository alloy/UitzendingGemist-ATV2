#import "BackRow.h"

@interface UZGBaseListController : BRMediaMenuController <BRMenuListItemProvider>

@property (nonatomic, retain) NSArray *assets;
@property (nonatomic, retain) NSString *realTitle;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger lastPage;
@property (retain) NSMutableDictionary *bannerCache;

- (void)fetchAssets;
- (void)selectedAsset:(long)row;
- (void)fetchedAssetsAndLastPage:(NSArray *)assetsAndLastPage;
- (BOOL)isPaginationRow:(long *)row previous:(BOOL *)previous;
- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;

@end
