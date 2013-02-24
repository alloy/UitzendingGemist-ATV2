#import "BackRow.h"
#import "UZGClient.h"

@interface UZGBaseMediaAsset : BRBaseMediaAsset

@property (strong) NSString *title;
@property (strong) NSString *path;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;

@property (strong) NSURL *previewURL;
@property (strong) BRImage *thumbnail;

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;

- (void)withThumbnail:(dispatch_block_t)success failure:(UZGFailureBlock)failure;

@end
