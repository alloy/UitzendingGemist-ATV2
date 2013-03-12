#import "BackRow.h"
#import "UZGClient.h"

@interface UZGBaseMediaAsset : NSManagedObject

// Managed object properties.
//
// The URL path, which is used as identifier.
@property (strong) NSString *path;
@property (strong) NSString *previewURLString;
// This is not actually persisted to the DB, but provides convenience method to
// get previewURLString.
@property (nonatomic, strong) NSURL *previewURL;

@property (strong) NSString *title;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;

+ (instancetype)assetByPath:(NSString *)path
     inManagedObjectContext:(NSManagedObjectContext *)context;

- (id)imageProxy;

@end
