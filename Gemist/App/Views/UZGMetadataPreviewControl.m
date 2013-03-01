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

//- (void)layoutSubcontrols;
//{
  //[super layoutSubcontrols];
  //NSLog(@"LAYOUT!");
  ////NSLog(@"FULL FRAME: %@", NSStringFromCGRect([self.layer frame]));
  ////for (id layer in [self.layer sublayers]) {
    ////NSLog(@"SUBLAYER FRAME: %@", NSStringFromCGRect([layer frame]));
  ////}
  //id sublayer = [self.layer sublayers][0];
  //CGRect frame = [sublayer frame];
  //NSLog(@"BEFORE: %@", NSStringFromCGRect(frame));
  //frame.origin.y = CGRectGetHeight([self.layer frame]) - frame.size.height;
  //NSLog(@"AFTER: %@", NSStringFromCGRect(frame));
  //[sublayer setFrame:frame];
//}

@end
