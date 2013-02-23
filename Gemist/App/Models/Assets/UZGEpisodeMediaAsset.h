#import "UZGBaseMediaAsset.h"

@class UZGEpisodeMediaAsset;

@protocol UZGEpisodeMediaAssetDelegate <NSObject>
- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episodeMediaAsset hasBeenPlayed:(BOOL)played;
- (void)episodeMediaAssetDidStopPlayback:(UZGEpisodeMediaAsset *)episodeMediaAsset;
@end

@interface UZGEpisodeMediaAsset : UZGBaseMediaAsset <BRMediaAsset>

@property (weak) id<UZGEpisodeMediaAssetDelegate> delegate;
@property (assign) NSUInteger duration;
@property (strong) NSString *mediaURL;

- (void)withMediaURL:(dispatch_block_t)success failure:(UZGFailureBlock)failure;

@end
