#import "UZGAssetsListController.h"
#import "UZGEpisodeMediaAsset.h"

@class UZGShowMediaAsset;

@interface UZGEpisodesListController : UZGAssetsListController <BRMenuListItemProvider, UZGEpisodeMediaAssetDelegate>

- (id)initWithShow:(UZGShowMediaAsset *)show;

@end
