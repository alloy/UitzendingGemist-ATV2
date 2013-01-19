#import "BRThemeInfo.h"
#import "BRImage.h"

@implementation BRThemeInfo

+ (BRThemeInfo *)sharedTheme;
{
  static dispatch_once_t onceToken;
  static BRThemeInfo *sharedTheme;
  dispatch_once(&onceToken, ^{
    sharedTheme = [self new];
  });
  return sharedTheme;
}

- (BRImage *)appleTVIconOOB;
{
  return nil;
}

@end
