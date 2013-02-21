#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"

@implementation UZGShowMediaAsset

+ (void)showsWithTitleInitial:(NSString *)initial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)failure;
{
  UitzendingGemistAPIClient *client = [UitzendingGemistAPIClient sharedClient];
  [client showsWithTitleInitial:initial
                           page:pageNumber
                        success:^(UZGPaginationData *data) { success([self assetsWithPaginationData:data]); }
                        failure:failure];
}

- (void)episodesAtPage:(NSInteger)pageNumber
               success:(UZGPaginationDataBlock)success
               failure:(UZGFailureBlock)failure;
{
  UitzendingGemistAPIClient *client = [UitzendingGemistAPIClient sharedClient];
  [client episodesOfShowAtPath:self.path
                          page:pageNumber
                       success:^(UZGPaginationData *data) { success([UZGEpisodeMediaAsset assetsWithPaginationData:data]); }
                       failure:failure];
}

@end
