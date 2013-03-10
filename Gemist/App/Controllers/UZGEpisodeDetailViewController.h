#import "BackRow.h"
#import "UZGEpisodeMediaAsset.h"


@interface UZGEpisodeDetailViewController : BRController <UZGEpisodeMediaAssetDelegate>

@property (strong) UZGEpisodeMediaAsset *episode;

- (instancetype)initWithEpisode:(UZGEpisodeMediaAsset *)episode;

@end
