#import "BRTopShelfView+ProductImage.h"
#import "BackRowExtras.h"
#import "BackRow.h"

@implementation BRTopShelfView (ProductImage)

- (BRImageControl *)productImage {
  return MSHookIvar<BRImageControl *>(self, "_productImage");
}

@end
