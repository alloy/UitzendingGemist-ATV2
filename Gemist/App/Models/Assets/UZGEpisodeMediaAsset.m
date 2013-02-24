#import "UZGEpisodeMediaAsset.h"
#import "UZGPlistStore.h"

@interface UZGEpisodeMediaAsset ()
@end

@implementation UZGEpisodeMediaAsset

- (void)dealloc;
{
  _delegate = nil;
}

// TODO how do we provide the other streams so the player can be adaptive?
- (void)withMediaURL:(dispatch_block_t)success failure:(UZGFailureBlock)failure;
{
  if (self.mediaURL) {
    success();
    return;
  }
  UZGClient *client = [UZGClient sharedClient];
  [client episodeStreamSourcesForPath:self.path
                              success:^(id _, NSArray *sources) { self.mediaURL = [sources[0] absoluteString]; success(); }
                              failure:failure];
}

#pragma mark - Actually implemented

// This controls the way in which BRMetadataControl displays the metadata.
//- (id)mediaType;
//{
  //return [BRMediaType TVShow];
//}

- (BOOL)hasBeenPlayed;
{
  return [[UZGPlistStore sharedStore] playedEpisodeForPath:self.path];
}

- (void)setHasBeenPlayed:(BOOL)played;
{
  [[UZGPlistStore sharedStore] setPlayed:played forEpisodePath:self.path];
  [self.delegate episodeMediaAsset:self hasBeenPlayed:played];
}

- (NSUInteger)duration;
{
  return [[UZGPlistStore sharedStore] durationOfEpisodeForPath:self.path];
}

- (void)setDuration:(NSUInteger)duration;
{
  [[UZGPlistStore sharedStore] setDuration:duration forEpisodePath:self.path];
}

// Called when paused and when the user stops playback by navigating back.
- (void)setBookmarkTimeInSeconds:(unsigned int)seconds;
{
  [[UZGPlistStore sharedStore] setBookmarkTime:seconds forEpisodePath:self.path];
  [self.delegate episodeMediaAssetDidStopPlayback:self];
}

- (unsigned int)bookmarkTimeInSeconds;
{
  return [[UZGPlistStore sharedStore] bookmarkTimeForEpisodePath:self.path];
}

@end
