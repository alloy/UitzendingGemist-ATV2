#import "UZGMetadataPreviewControl.h"
#import "UZGBaseMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"

@implementation UZGMetadataPreviewControl

- (instancetype)initWithAsset:(UZGBaseMediaAsset *)asset;
{
  if ((self = [super init])) {
    self.showsMetadataImmediately = YES;
    self.asset = asset;
  }
  return self;
}

// Don’t call super, which will layout the control based on the `mediaType` of the
// asset. In the case of an episode this means it doesn’t show the copyright line.
- (void)setAsset:(UZGBaseMediaAsset<UZGMediaAsset> *)asset;
{
  self.imageProxy = asset.imageProxy;

  BRMetadataControl *metadataControl = self.metadataControl;
  metadataControl.title = asset.title;
  metadataControl.summary = asset.mediaSummary;
  metadataControl.copyright = asset.copyright;

  if ([asset isKindOfClass:[UZGEpisodeMediaAsset class]]) {
    UZGEpisodeMediaAsset *episode = (UZGEpisodeMediaAsset *)asset;
    if (episode.showTitle) {
      [metadataControl setMetadata:@[episode.showTitle]
                        withLabels:@[UZGLocalizedString(@"Show")]];
    }
  }
}

@end
