#import "UZGMetadataPreviewControl.h"
#import "UZGBaseMediaAsset.h"

@interface UZGMetadataPreviewControl ()
@property (strong) BRImageControl *eyeImageControl;
@end

@implementation UZGMetadataPreviewControl

- (void)setAsset:(UZGBaseMediaAsset *)asset;
{
  [super setAsset:asset];
  BRMetadataControl *metadataControl = self.metadataControl;
  [metadataControl setTitle:asset.title];
  [metadataControl setSummary:asset.mediaSummary];
  [metadataControl setCopyright:asset.copyright];

  // NSString *rating = asset.rating;
  NSString *rating = @"123.456";
  if (rating) {
    self.eyeImageControl = [BRImageControl new];
    [[self.metadataControl valueForKey:@"_ratingImageLayer"] addControl:self.eyeImageControl];
    // This is obviously lame-ish, but this way of making the frame larger is a
    // lot easier than do a real layout manager and means it's probably less
    // hard to update in the future, if the APIs change.
    [metadataControl setRating:[rating stringByAppendingString:@"     ᐧ"]];
  }
}

- (void)layoutSubcontrols;
{
  [super layoutSubcontrols];

  if (self.eyeImageControl) {
    self.eyeImageControl.image = [BRImage imageWithURL:[UZGBundle URLForResource:@"eye" withExtension:@"png"]];
    [self.eyeImageControl sizeToFit];

    BRImageControl *ratingImageControl = [self.metadataControl valueForKey:@"_ratingImageLayer"];
    CGRect bounds = [ratingImageControl.layer bounds];

    CGFloat width = 28;
    CGFloat height = 14;
    //CGFloat width = ceilf((44.0 / 22.0) * height);

    CGFloat y = 5;
    // CGFloat y = ceilf((bounds.size.height - height) / 2);

    CGRect frame = CGRectMake(bounds.size.width - width - 6, y, width, height);
    [self.eyeImageControl.layer setFrame:frame];
  }
}

@end
