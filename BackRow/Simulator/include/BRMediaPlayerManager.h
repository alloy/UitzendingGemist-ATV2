#import <Foundation/Foundation.h>

@interface BRMediaPlayerManager : NSObject

+ (BRMediaPlayerManager *)singleton;

- (void)presentMediaAsset:(id<BRMediaAsset>)mediaAsset options:(id)options;
- (id)playerForMediaAsset:(id<BRMediaAsset>)mediaAsset error:(NSError **)error;
- (void)presentPlayer:(id)player options:(id)options;

@end
