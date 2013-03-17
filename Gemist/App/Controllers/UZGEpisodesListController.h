#import "UZGAssetsListController.h"

@class UZGShowMediaAsset;

@interface UZGEpisodesListController : UZGAssetsListController <BRMenuListItemProvider>

- (id)initWithShow:(UZGShowMediaAsset *)show context:(NSManagedObjectContext *)context;

@end
