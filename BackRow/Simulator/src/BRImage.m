#import "BRImage.h"

@implementation BRImage

+ (BRImage *)imageWithURL:(NSURL *)URL;
{
  return nil;
}

@end

@implementation UIImage (BackRow)

+ (UIImage *)backRowImageNamed:(NSString *)name;
{
  NSBundle *simBundle = [NSBundle mainBundle];
  NSBundle *backRowBundle = [NSBundle bundleWithURL:[simBundle URLForResource:@"BackRow"
                                                                withExtension:@"bundle"
                                                                 subdirectory:nil]];
  NSString *imagePath = [backRowBundle pathForResource:name ofType:@"png"];
  if (imagePath) {
    return [UIImage imageWithContentsOfFile:imagePath];
  } else {
    return nil;
  }
}

@end
