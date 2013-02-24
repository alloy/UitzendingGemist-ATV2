#import "UZGBaseMediaAsset.h"
#import "UZGClient.h"

@implementation UZGBaseMediaAsset

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;
{
  NSMutableArray *assets = [[NSMutableArray alloc] initWithCapacity:paginationData.entries.count];
  for (NSDictionary *assetData in paginationData.entries) {
    UZGBaseMediaAsset *asset = [self new];
    [asset setValuesForKeysWithDictionary:assetData];
    [assets addObject:asset];
  }
  UZGPaginationData *result = [paginationData dataWithEntries:assets];
  return result;
}

- (NSString *)previewURLString;
{
  return [self.previewURL absoluteString];
}

- (void)setPreviewURLString:(NSString *)previewURLString;
{
  self.previewURL = [NSURL URLWithString:previewURLString];
}

- (id)imageProxy;
{
  if (self.previewURL) {
    return [BRURLImageProxy proxyWithURL:self.previewURL];
  } else {
    return [BRURLImageProxy proxyWithURL:[UZGBundle URLForResource:@"ThumbnailPlaceholder" withExtension:@"png"]];
  }
}

#pragma mark - Debug

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
