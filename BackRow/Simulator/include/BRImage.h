#import <UIKit/UIKit.h>

@interface BRImage : UIImage

@end

// Private implementation
@interface UIImage (BackRow)
+ (UIImage *)backRowImageNamed:(NSString *)name;
@end
