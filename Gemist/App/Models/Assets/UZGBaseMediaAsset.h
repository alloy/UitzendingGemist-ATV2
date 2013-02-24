#import "BackRow.h"
#import "UZGClient.h"

@interface UZGBaseMediaAsset : BRBaseMediaAsset

@property (strong) NSString *title;
@property (strong) NSString *path;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;
@property (strong) NSString *rating;

// This is merely for plist serialization purposes.
@property (nonatomic, strong) NSString *previewURLString;
@property (strong) NSURL *previewURL;

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;

- (id)imageProxy;

@end
