#import "UZGBaseMediaAsset.h"

@interface UZGShowMediaAsset : UZGBaseMediaAsset // TODO <BRMediaAsset>

@property (retain) NSString *title;
@property (retain) NSString *path;

+ (void)showsWithTitleInitial:(NSString *)initial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)falure;

- (void)episodesAtPage:(NSInteger)pageNumber
               success:(UZGPaginationDataBlock)success
               failure:(UZGFailureBlock)falure;

@end
