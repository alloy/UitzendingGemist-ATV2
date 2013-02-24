#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"
#import "UZGPlistStore.h"

@interface UZGShowMediaAsset ()
@property (assign) BOOL shouldLoadBookmarkedStatus;
@end

@implementation UZGShowMediaAsset

@synthesize bookmarked = _bookmarked;

+ (void)showsWithTitleInitial:(NSString *)initial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client showsWithTitleInitial:initial
                           page:pageNumber
                        success:^(UZGPaginationData *data) { success([self assetsWithPaginationData:data]); }
                        failure:failure];
}

- (instancetype)initAsBookmarked;
{
  if ((self = [super init])) {
    _bookmarked = YES;
    _shouldLoadBookmarkedStatus = NO;
  }
  return self;
}

- (instancetype)init;
{
  if ((self = [super init])) {
    _shouldLoadBookmarkedStatus = YES;
  }
  return self;
}

- (NSDictionary *)serializeAsDictionary;
{
  NSMutableDictionary *attributes = [NSMutableDictionary new];
  for (NSString *key in @[@"title", @"mediaSummary", @"copyright", @"previewURLString"]) {
    NSString *value = [self valueForKey:key];
    if (value) attributes[key] = value;
  }
  return [attributes copy];
}

- (void)episodesAtPage:(NSInteger)pageNumber
               success:(UZGPaginationDataBlock)success
               failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client episodesOfShowAtPath:self.path
                          page:pageNumber
                       success:^(UZGPaginationData *data) {
                                 UZGPaginationData *episodes = [UZGEpisodeMediaAsset assetsWithPaginationData:data];
                                 [episodes.entries setValue:self.copyright forKey:@"copyright"];
                                 success(episodes);
                               }
                       failure:failure];
}

- (BOOL)isBookmarked;
{
  if (self.shouldLoadBookmarkedStatus) {
    self.shouldLoadBookmarkedStatus = NO;
    _bookmarked = [[UZGPlistStore sharedStore] hasBookmarkedShowForPath:self.path];
  }
  return _bookmarked;
}

- (void)setBookmarked:(BOOL)bookmarked;
{
  if (_bookmarked != bookmarked) {
    _bookmarked = bookmarked;
    // No need to serialize when we'll be removing from the store.
    NSDictionary *attributes = bookmarked ? [self serializeAsDictionary] : nil;
    [[UZGPlistStore sharedStore] setHasBookmarkedShow:bookmarked
                                              forPath:self.path
                                           attributes:attributes];
  }
}

- (void)toggleBookmarked;
{
  self.bookmarked = !self.isBookmarked;
}

@end
