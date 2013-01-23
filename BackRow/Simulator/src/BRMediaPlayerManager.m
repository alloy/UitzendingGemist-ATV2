#import "BRMediaPlayerManager.h"
#import <MediaPlayer/MediaPlayer.h>

@interface BRMediaPlayerManager ()
@property (retain) id<BRMediaAsset> currentAsset;
@end

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

- (id)init;
{
  if ((self = [super init])) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayerStateChanged:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:nil];
  }
  return self;
}

- (void)presentMediaAsset:(id<BRMediaAsset>)asset options:(id)options;
{
  // TODO would be nice to release it when the view controller closes
  self.currentAsset = asset;

  NSURL *URL = [NSURL URLWithString:[asset mediaURL]];
  MPMoviePlayerViewController *controller = [[MPMoviePlayerViewController alloc] initWithContentURL:URL];
  UIWindow *window = [[UIApplication sharedApplication] keyWindow];
  UINavigationController *stack = (UINavigationController *)window.rootViewController;
  [stack pushViewController:controller animated:YES];
  [controller release];
}

- (void)moviePlayerStateChanged:(NSNotification *)notification;
{
  if (self.currentAsset) {
    MPMoviePlayerController *player = (MPMoviePlayerController *)notification.object;
    if (player.playbackState == MPMoviePlaybackStatePlaying) {
      self.currentAsset.hasBeenPlayed = YES;
    }
  }
}

@end
