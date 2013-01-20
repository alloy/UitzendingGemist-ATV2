#import "BRMediaPlayerManager.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation BRMediaPlayerManager

+ (BRMediaPlayerManager *)singleton;
{
  static dispatch_once_t onceToken;
  static BRMediaPlayerManager *managerInstance;
  dispatch_once(&onceToken, ^{
    managerInstance = [self new];
  });
  return managerInstance;
}

- (void)presentMediaAsset:(id<BRMediaAsset>)asset options:(id)options;
{
  NSURL *URL = [NSURL URLWithString:[asset mediaURL]];
  MPMoviePlayerViewController *controller = [[MPMoviePlayerViewController alloc] initWithContentURL:URL];
  UIWindow *window = [[UIApplication sharedApplication] keyWindow];
  UINavigationController *stack = (UINavigationController *)window.rootViewController;
  [stack pushViewController:controller animated:YES];
  [controller release];
}

@end
