#import "UZGBaseMediaAsset.h"

@implementation UZGBaseMediaAsset

+ (UZGPaginationData *)assetsWithPaginationData:(UZGPaginationData *)paginationData;
{
  NSMutableArray *assets = [[NSMutableArray alloc] initWithCapacity:paginationData.entries.count];
  for (NSDictionary *assetData in paginationData.entries) {
    UZGBaseMediaAsset *asset = [self new];
    [asset setValuesForKeysWithDictionary:assetData];
    [assets addObject:asset];
    [asset release];
  }
  UZGPaginationData *result = [paginationData dataWithEntries:assets];
  [assets release];
  return result;
}

@end
