#import "BackRow.h"

@class UZGBaseMediaAsset;

@interface UZGMetadataPreviewControl : BRMetadataPreviewControl

- (instancetype)initWithAsset:(UZGBaseMediaAsset *)asset;
- (void)setAsset:(UZGBaseMediaAsset *)asset;

@end
