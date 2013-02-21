#import "BRTopShelfView.h"
#import "BRImageControl.h"

@interface BRTopShelfView ()
@property (nonatomic, strong) BRImageControl *productImage;
@end

@implementation BRTopShelfView


- (id)initWithFrame:(CGRect)frame;
{
  if ((self = [super initWithFrame:frame])) {
    _productImage = [BRImageControl new];
  }
  return self;
}

@end
