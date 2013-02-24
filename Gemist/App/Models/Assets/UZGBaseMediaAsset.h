#import "BackRow.h"
#import "UZGClient.h"

@interface UZGBaseMediaAsset : BRBaseMediaAsset

@property (strong) NSString *title;
@property (strong) NSString *path;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;
@property (strong) NSString *rating;

@property (strong) NSURL *previewURL;
@property (strong) BRImage *thumbnail;

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;

- (id)imageProxy;

@end
