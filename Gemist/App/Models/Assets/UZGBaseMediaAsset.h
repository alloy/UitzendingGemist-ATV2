#import "BackRow.h"
#import "UZGClient.h"

@protocol UZGMediaAsset
@property (strong) NSString *title;
@property (strong) NSString *mediaSummary;
@property (strong) NSString *copyright;
@property (strong) NSString *previewURLString;
@end

@interface UZGBaseMediaAsset : NSManagedObject

// This context should always be present, because it's what is used when the record is not in the store.
@property (strong) NSManagedObjectContext *insertIntoContext;

// Managed object properties.
//
// The URL path, which is used as identifier.
@property (strong) NSString *path;

// This is not actually persisted to the DB, but provides convenience method to
// get previewURLString.
@property (nonatomic, strong) NSURL *previewURL;


+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData
                                        context:(NSManagedObjectContext *)context;

+ (instancetype)assetByPath:(NSString *)path
     inManagedObjectContext:(NSManagedObjectContext *)context;

- (id)imageProxy;

@end
