#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"
#import "UZGPlistStore.h"

@implementation UZGShowMediaAsset

@dynamic title;
@dynamic mediaSummary;
@dynamic copyright;
@dynamic previewURLString;

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

- (instancetype)initWithTitle:(NSString *)title path:(NSString *)path;
{
  if ((self = [self init])) {
    self.title = title;
    self.path = path;
  }
  return self;
}

// TODO is this still needed without plist store
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

- (BOOL)isBookmarked;
{
  NSLog(@"%@ - %@", self, self.managedObjectContext);
  return self.managedObjectContext != nil;
}

// TODO this should happen in a block, also on the background?
- (void)setBookmarked:(BOOL)bookmarked;
{
  if (bookmarked) {
    if (!self.isBookmarked) {
      NSLog(@"[Gemist] Add to bookmarks!");
      [self.insertIntoContext insertObject:self];
    }
  } else {
    if (self.isBookmarked) {
      NSLog(@"[Gemist] Remove from bookmarks!");
      [self.managedObjectContext deleteObject:self];
    }
  }
  if (self.insertIntoContext.hasChanges) {
    NSLog(@"[Gemist] Saving bookmark changes!");
    [self.insertIntoContext recursiveSave];
  }
}

- (void)toggleBookmarked;
{
  self.bookmarked = !self.isBookmarked;
}

@end
