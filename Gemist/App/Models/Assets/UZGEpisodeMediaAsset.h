#import "UZGBaseMediaAsset.h"

typedef NS_ENUM(NSUInteger, UZGEpisodeProgressStatus) {
  UZGEpisodeUnplayedStatus,
  UZGEpisodeUnplayedPartialStatus,
  UZGEpisodePlayedStatus
};

@class UZGShowMediaAsset;

@interface UZGEpisodeMediaAsset : UZGBaseMediaAsset <BRMediaAsset, UZGMediaAsset>

@property (strong) NSString *title;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;
@property (strong) NSString *previewURLString;

// Managed object properties
@property (assign, nonatomic) unsigned int duration;
@property (assign, nonatomic) unsigned int bookmarkTimeInSeconds;
@property (assign, nonatomic) BOOL hasFinishedPlaying;

@property (strong) NSString *mediaURL;

@property (strong) NSString *showTitle;
@property (strong) NSString *showPath;
@property (strong, nonatomic) UZGShowMediaAsset *show;

@property (readonly) UZGEpisodeProgressStatus progressStatus;

+ (void)episodesWithSearchQuery:(NSString *)query
                        context:(NSManagedObjectContext *)context
                           page:(NSUInteger)pageNumber
                        success:(UZGPaginationDataBlock)success
                        failure:(UZGFailureBlock)failure;

- (void)withMediaURL:(dispatch_block_t)success failure:(UZGFailureBlock)failure;

@end
