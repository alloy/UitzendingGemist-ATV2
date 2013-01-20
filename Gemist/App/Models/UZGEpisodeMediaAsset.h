#import "BackRow.h"

@interface UZGEpisodeMediaAsset : BRBaseMediaAsset <BRMediaAsset>

@property (assign) BOOL hasBeenPlayed;

- (id)initWithEpisodePath:(NSString *)path streamURLs:(NSArray *)streamURLs;

@end
