#import "UZGBaseMediaAsset.h"
#import "UZGClient.h"

@implementation UZGBaseMediaAsset

@dynamic path;

@synthesize insertIntoContext;

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData
                                        context:(NSManagedObjectContext *)context;
{
  NSMutableArray *assets = [[NSMutableArray alloc] initWithCapacity:paginationData.entries.count];
  for (NSDictionary *assetData in paginationData.entries) {
    // First check if we have stored data for this asset
    NSAssert(assetData[@"path"] != nil, @"Should have a path!");
    UZGBaseMediaAsset *asset = [self findFirstWhereProperty:@"path"
                                                  isEqualTo:assetData[@"path"]
                                                  inContext:context];
    if (!asset) {
      // Otherwise create an instance, but do *not* insert it into the context!
      asset = [[self alloc] initWithEntity:[self entityDescriptionInContext:context]
            insertIntoManagedObjectContext:nil];
    }
    asset.insertIntoContext = context;
    // Even for an existing asset the data should be the same, so update regardless.
    [asset setValuesForKeysWithDictionary:assetData];
    [assets addObject:asset];
  }
  UZGPaginationData *result = [paginationData dataWithEntries:assets];
  return result;
}

+ (instancetype)assetByPath:(NSString *)path
     inManagedObjectContext:(NSManagedObjectContext *)context;
{
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(self)];
  request.predicate = [NSPredicate predicateWithFormat:@"path == %@", path];
  NSError *error = nil;
  NSArray *result = [context executeFetchRequest:request error:&error];
  NSAssert(error == nil, @"Fetch request error: %@", error);
  NSAssert(result.count <= 1, @"More than one asset with the same path found: %@", result);
  UZGBaseMediaAsset *asset = result[0];
  asset.insertIntoContext = context;
  return asset;
}

- (NSURL *)previewURL;
{
  return [NSURL URLWithString:[(id<UZGMediaAsset>)self previewURLString]];
}

- (void)setPreviewURL:(NSURL *)previewURL;
{
  [(id<UZGMediaAsset>)self setPreviewURLString:[previewURL absoluteString]];
}

- (id)imageProxy;
{
  if (self.previewURL) {
    return [BRURLImageProxy proxyWithURL:self.previewURL];
  } else {
    return [BRURLImageProxy proxyWithURL:[UZGBundle URLForResource:@"ThumbnailPlaceholder" withExtension:@"png"]];
  }
}

//#pragma mark - Debug

//+ (BOOL)conformsToProtocol:(Protocol *)protocol;
//{
  //BOOL conforms = [super conformsToProtocol:protocol];
  //if (!conforms) {
    //NSLog(@"Does not conform to protocol: %@", NSStringFromProtocol(protocol));
  //}
  //return conforms;
//}

//- (BOOL)conformsToProtocol:(Protocol *)protocol;
//{
  //BOOL conforms = [super conformsToProtocol:protocol];
  //if (!conforms) {
    //NSLog(@"Does not conform to protocol: %@", NSStringFromProtocol(protocol));
  //}
  //return conforms;
//}

//- (BOOL)respondsToSelector:(SEL)selector;
//{
  //BOOL responds = [super respondsToSelector:selector];
  //if (!responds) {
    //NSLog(@"Does not respond to selector: %@", NSStringFromSelector(selector));
  //}
  //return responds;
//}

@end
