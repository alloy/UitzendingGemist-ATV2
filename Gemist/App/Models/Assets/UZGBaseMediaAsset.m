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

// TODO Should we use a placeholder image when there is none?
- (void)withThumbnail:(dispatch_block_t)success failure:(UZGFailureBlock)failure;
{
  if (self.thumbnail) {
    success();
    return;
  }
  UZGClient *client = [UZGClient sharedClient];
  [client loadImageFromURL:self.previewURL
                   success:^(id _, BRImage *thumbnail) { self.thumbnail = thumbnail; success(); }
                   failure:failure];
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
