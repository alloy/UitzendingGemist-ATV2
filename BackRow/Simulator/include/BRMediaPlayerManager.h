#import <Foundation/Foundation.h>

@interface BRMediaPlayerManager : NSObject

+ (BRMediaPlayerManager *)singleton;

- (void)presentMediaAsset:(id<BRMediaAsset>)asset options:(id)options;

@end
