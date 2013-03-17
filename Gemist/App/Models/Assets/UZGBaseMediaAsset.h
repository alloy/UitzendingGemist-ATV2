#import "BackRow.h"
#import "UZGClient.h"

@protocol UZGMediaAsset
@property (strong) NSString *title;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;
@property (strong) NSString *previewURLString;
@end

@interface UZGBaseMediaAsset : NSManagedObject

// Managed object properties.
//
// The URL path, which is used as identifier.
@property (strong) NSString *path;

// This is not actually persisted to the DB, but provides convenience method to
// get previewURLString.
@property (nonatomic, strong) NSURL *previewURL;


+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;

+ (instancetype)assetByPath:(NSString *)path
     inManagedObjectContext:(NSManagedObjectContext *)context;

- (id)imageProxy;

@end
