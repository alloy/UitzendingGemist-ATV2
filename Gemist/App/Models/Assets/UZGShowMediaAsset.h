#import "UZGBaseMediaAsset.h"

@interface UZGShowMediaAsset : UZGBaseMediaAsset

@property (nonatomic, assign, getter=isBookmarked) BOOL bookmarked;

+ (void)showsWithTitleInitial:(NSString *)initial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)falure;

- (instancetype)initAsBookmarked;
- (instancetype)initWithTitle:(NSString *)title path:(NSString *)path;

- (void)toggleBookmarked;

- (void)episodesAtPage:(NSInteger)pageNumber
               success:(UZGPaginationDataBlock)success
               failure:(UZGFailureBlock)falure;

@end
