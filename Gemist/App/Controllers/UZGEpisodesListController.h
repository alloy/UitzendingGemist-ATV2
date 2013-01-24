#import "UZGBaseListController.h"
#import "UZGEpisodeMediaAsset.h"

@interface UZGEpisodesListController : UZGBaseListController <BRMenuListItemProvider, UZGEpisodeMediaAssetDelegate>

- (id)initWithShowTitle:(NSString *)title path:(NSString *)path;

@end
