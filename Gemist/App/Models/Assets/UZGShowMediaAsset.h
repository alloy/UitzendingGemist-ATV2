#import "UZGBaseMediaAsset.h"

@interface UZGShowMediaAsset : UZGBaseMediaAsset <UZGMediaAsset>

@property (nonatomic, assign, getter=isBookmarked) BOOL bookmarked;

+ (NSArray *)favoritedShowsInContext:(NSManagedObjectContext *)context;

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
