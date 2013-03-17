#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"
#import "UZGPlistStore.h"

@interface UZGShowMediaAsset ()
@property (assign) BOOL shouldLoadBookmarkedStatus;
@end

@implementation UZGShowMediaAsset

@dynamic title;
@dynamic mediaSummary;
@dynamic copyright;
@dynamic previewURLString;

@synthesize bookmarked = _bookmarked, shouldLoadBookmarkedStatus = _shouldLoadBookmarkedStatus;

// All stored shows are favorites.
+ (NSArray *)favoritedShowsInContext:(NSManagedObjectContext *)context;
{
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"UZGShowMediaAsset"];
  NSError *error = nil;
  NSArray *result = [context executeFetchRequest:request error:&error];
  NSAssert(error == nil, @"Fetch request error: %@", error);
  return result;

}

+ (void)showsWithTitleInitial:(NSString *)initial
                      context:(NSManagedObjectContext *)context
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client showsWithTitleInitial:initial
                           page:pageNumber
                        success:^(UZGPaginationData *data) { success([self assetsWithPaginationData:data context:context]); }
                        failure:failure];
}

- (instancetype)init;
{
  if ((self = [super init])) {
    _shouldLoadBookmarkedStatus = YES;
  }
  return self;
}

- (instancetype)initAsBookmarked;
{
  if ((self = [super init])) {
    _bookmarked = YES;
    _shouldLoadBookmarkedStatus = NO;
  }
  return self;
}

- (instancetype)initWithTitle:(NSString *)title path:(NSString *)path;
{
  if ((self = [self init])) {
    self.title = title;
    self.path = path;
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
               context:(NSManagedObjectContext *)context
               success:(UZGPaginationDataBlock)success
               failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client episodesOfShowAtPath:self.path
                          page:pageNumber
                       success:^(UZGPaginationData *data) {
                                 UZGPaginationData *episodes = [UZGEpisodeMediaAsset assetsWithPaginationData:data
                                                                                                      context:context];
                                 [episodes.entries setValue:self forKey:@"show"];
                                 [episodes.entries setValue:self.copyright forKey:@"copyright"];
                                 success(episodes);
                               }
                       failure:failure];
}

// TODO
- (BOOL)isBookmarked;
{
  //if (self.shouldLoadBookmarkedStatus) {
    //self.shouldLoadBookmarkedStatus = NO;
    //_bookmarked = [[UZGPlistStore sharedStore] hasBookmarkedShowForPath:self.path];
  //}
  //return _bookmarked;
  return NO;
}

// TODO
- (void)setBookmarked:(BOOL)bookmarked;
{
  //if (_bookmarked != bookmarked) {
    //_bookmarked = bookmarked;
    //// No need to serialize when we'll be removing from the store.
    //NSDictionary *attributes = bookmarked ? [self serializeAsDictionary] : nil;
    //[[UZGPlistStore sharedStore] setHasBookmarkedShow:bookmarked
                                              //forPath:self.path
                                           //attributes:attributes];
  //}
}

- (void)toggleBookmarked;
{
  self.bookmarked = !self.isBookmarked;
}

@end
