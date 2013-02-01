#import <UIKit/UIKit.h>

@interface BRImage : UIImage
+ (BRImage *)imageWithURL:(NSURL *)URL;
@end

// Private implementation
@interface UIImage (BackRow)
+ (UIImage *)backRowImageNamed:(NSString *)name;
@end
