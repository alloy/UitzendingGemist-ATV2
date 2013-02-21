#import "UZGBaseMediaAsset.h"

@class UZGEpisodeMediaAsset;

@protocol UZGEpisodeMediaAssetDelegate <NSObject>
- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episodeMediaAsset hasBeenPlayed:(BOOL)played;
- (void)episodeMediaAssetDidStopPlayback:(UZGEpisodeMediaAsset *)episodeMediaAsset;
@end

@interface UZGEpisodeMediaAsset : UZGBaseMediaAsset <BRMediaAsset>

@property (assign) id<UZGEpisodeMediaAssetDelegate> delegate;
@property (assign) NSUInteger duration;
@property (retain) NSURL *previewURL;
@property (retain) NSString *mediaURL;
@property (retain) NSString *title;
@property (retain) NSString *path;

- (void)withMediaURL:(dispatch_block_t)success failure:(UZGFailureBlock)failure;

@end
