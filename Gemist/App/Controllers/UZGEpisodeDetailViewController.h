#import "BackRow.h"

@class UZGEpisodeMediaAsset;

@interface UZGEpisodeDetailViewController : BRController

@property (strong) UZGEpisodeMediaAsset *episode;

- (instancetype)initWithEpisode:(UZGEpisodeMediaAsset *)episode;

@end
