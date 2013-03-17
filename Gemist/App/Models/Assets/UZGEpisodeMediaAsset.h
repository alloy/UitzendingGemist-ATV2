#import "UZGBaseMediaAsset.h"

@class UZGEpisodeMediaAsset, UZGShowMediaAsset;

@protocol UZGEpisodeMediaAssetDelegate <NSObject>
- (void)episodeMediaAsset:(UZGEpisodeMediaAsset *)episodeMediaAsset hasBeenPlayed:(BOOL)played;
@optional
- (void)episodeMediaAssetDidStopPlayback:(UZGEpisodeMediaAsset *)episodeMediaAsset;
@end

@interface UZGEpisodeMediaAsset : UZGBaseMediaAsset <BRMediaAsset, UZGMediaAsset>

// Managed object properties
@property (assign) NSUInteger duration;
@property (assign) NSUInteger bookmarkTimeInSeconds;
@property (assign) BOOL hasBeenPlayed;

@property (weak) id<UZGEpisodeMediaAssetDelegate> delegate;
@property (strong) NSString *mediaURL;

@property (strong) NSString *showTitle;
@property (strong) NSString *showPath;
@property (strong, nonatomic) UZGShowMediaAsset *show;

+ (void)episodesWithSearchQuery:(NSString *)query
                           page:(NSUInteger)pageNumber
                        success:(UZGPaginationDataBlock)success
                        failure:(UZGFailureBlock)failure;

- (void)withMediaURL:(dispatch_block_t)success failure:(UZGFailureBlock)failure;

@end
