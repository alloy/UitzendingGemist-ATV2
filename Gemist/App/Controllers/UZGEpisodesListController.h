#import "UZGBaseListController.h"
#import "UZGEpisodeMediaAsset.h"

@class UZGShowMediaAsset;

@interface UZGEpisodesListController : UZGBaseListController <BRMenuListItemProvider, UZGEpisodeMediaAssetDelegate>

- (id)initWithShow:(UZGShowMediaAsset *)show;

@end
