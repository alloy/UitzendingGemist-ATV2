#import "BRTopShelfView.h"
#import "BRImageControl.h"

@interface BRTopShelfView ()
@property (nonatomic, retain) BRImageControl *productImage;
@end

@implementation BRTopShelfView

- (void)dealloc;
{
  [_productImage release];
  [super dealloc];
}

- (id)initWithFrame:(CGRect)frame;
{
  if ((self = [super initWithFrame:frame])) {
    _productImage = [BRImageControl new];
  }
  return self;
}

@end
