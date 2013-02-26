#import "UZGMetadataPreviewControl.h"
#import "UZGBaseMediaAsset.h"

@implementation UZGMetadataPreviewControl

- (instancetype)initWithAsset:(UZGBaseMediaAsset *)asset;
{
  if ((self = [super init])) {
    self.showsMetadataImmediately = YES;
    self.asset = asset;
  }
  return self;
}

- (void)setAsset:(UZGBaseMediaAsset *)asset;
{
  [super setAsset:asset];
  BRMetadataControl *metadataControl = self.metadataControl;
  [metadataControl setTitle:asset.title];
  [metadataControl setSummary:asset.mediaSummary];
  [metadataControl setCopyright:asset.copyright];
}

@end
