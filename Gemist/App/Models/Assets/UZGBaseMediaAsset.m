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

- (id)imageProxy;
{
  if (self.previewURL) {
    return [BRURLImageProxy proxyWithURL:self.previewURL];
  } else {
    return [BRURLImageProxy proxyWithURL:[UZGBundle URLForResource:@"ThumbnailPlaceholder" withExtension:@"png"]];
  }
}

@end
