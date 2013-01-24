#import "BackRow.h"

@class UZGEpisodeMediaAsset;

@protocol UZGEpisodeMediaAssetDelegate <NSObject>
- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episodeMediaAsset hasBeenPlayed:(BOOL)played;
- (void)episodeMediaAssetDidStopPlayback:(UZGEpisodeMediaAsset *)episodeMediaAsset;
@end

@interface UZGEpisodeMediaAsset : BRBaseMediaAsset <BRMediaAsset>

@property (assign) id<UZGEpisodeMediaAssetDelegate> delegate;
@property (assign) NSUInteger duration;

- (id)initWithEpisodePath:(NSString *)path streamURLs:(NSArray *)streamURLs;

@end
