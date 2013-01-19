#import "BRControl.h"

@class BRImageControl;

@interface BRTopShelfView : BRControl

// This is normally a hidden ivar, but is made accessible through the
// BRTopShelfView+ProductImage category.
- (BRImageControl *)productImage;

@end
