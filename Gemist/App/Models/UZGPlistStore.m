#import "UZGPlistStore.h"
#import "UZGShowMediaAsset.h"

static NSString * const kUZGPlistStoreBookmarkTimeKey  = @"BookmarkTime";
static NSString * const kUZGPlistStoreDurationKey      = @"Duration";
static NSString * const kUZGPlistStoreEpisodesKey      = @"PlayedEpisodes";
static NSString * const kUZGPlistStorePlayedKey        = @"Played";
static NSString * const kUZGPlistStoreShowBookmarksKey = @"ShowBookmarks";

// Consider it played if within the lst 5 minutes.
static const NSUInteger kUZGPlayedThresholdTime = 5 * 60;

@interface UZGPlistStore ()
@property (strong) NSString *storePath;
@property (strong) NSMutableDictionary *store;
@end

@implementation UZGPlistStore

+ (NSString *)storePath;
{
  return [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Preferences/nl.superalloy.Gemist.plist"];
}

- (id)init;
{
  if ((self = [super init])) {
    _storePath = [[self class] storePath];
    _store = [NSMutableDictionary dictionaryWithContentsOfFile:_storePath];
  }
  return self;
}

- (NSArray *)episodePaths;
{
  return [self.store[kUZGPlistStoreEpisodesKey] allKeys];
}

- (NSDictionary *)shows;
{
  return self.store[kUZGPlistStoreShowBookmarksKey];
}

//#pragma mark - shows

//- (NSArray *)allBookmarkedShows;
//{
  //NSDictionary *bookmarks = self.store[kUZGPlistStoreShowBookmarksKey];
  //NSMutableArray *result = [NSMutableArray arrayWithCapacity:bookmarks.count];
  //for (NSString *path in bookmarks) {
    //UZGShowMediaAsset *show = [[UZGShowMediaAsset alloc] initAsBookmarked];
    //show.path = path;
    //[show setValuesForKeysWithDictionary:bookmarks[path]];
    //[result addObject:show];
  //}
  //return [result sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]];
//}

//- (BOOL)hasBookmarkedShowForPath:(NSString *)path;
//{
  //return self.store[kUZGPlistStoreShowBookmarksKey][path] != nil;
//}

//- (void)setHasBookmarkedShow:(BOOL)bookmark forPath:(NSString *)path attributes:(NSDictionary *)attributes;
//{
  //if (bookmark) {
    //self.store[kUZGPlistStoreShowBookmarksKey][path] = attributes;
  //} else {
    //[self.store[kUZGPlistStoreShowBookmarksKey] removeObjectForKey:path];
  //}
  //[self saveStore];
//}

//#pragma mark - episodes

//- (void)setValue:(id)value forKey:(NSString *)key forEpisodePath:(NSString *)path;
//{
  //// NSLog(@"%s - %@, %@, %@", __PRETTY_FUNCTION__, value, key, path);
  //NSMutableDictionary *store = self.store[kUZGPlistStoreEpisodesKey];
  //NSDictionary *episode = store[path];
  //if (episode) {
    //NSMutableDictionary *mutableEpisode = [episode mutableCopy];
    //mutableEpisode[key] = value;
    //store[path] = [mutableEpisode copy];
  //} else {
    //store[path] = @{ key:value };
  //}
  //[self saveStore];
//}

- (id)valueForKey:(NSString *)key forEpisodePath:(NSString *)path;
{
  // NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, key, path);
  NSDictionary *episode = self.store[kUZGPlistStoreEpisodesKey][path];
  if (episode) return episode[key];
  return nil;
}

//- (void)setPlayed:(BOOL)played forEpisodePath:(NSString *)path;
//{
  //[self setValue:@(played) forKey:kUZGPlistStorePlayedKey forEpisodePath:path];
//}

//- (BOOL)playedEpisodeForPath:(NSString *)path;
//{
  //return [[self valueForKey:kUZGPlistStorePlayedKey forEpisodePath:path] boolValue];
//}

//- (void)setBookmarkTime:(NSUInteger)seconds forEpisodePath:(NSString *)path;
//{
  //[self setValue:@(seconds) forKey:kUZGPlistStoreBookmarkTimeKey forEpisodePath:path];
//}

- (NSUInteger)bookmarkTimeForEpisodePath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStoreBookmarkTimeKey forEpisodePath:path] unsignedIntegerValue];
}

//- (void)setDuration:(NSUInteger)seconds forEpisodePath:(NSString *)path;
//{
  //[self setValue:@(seconds) forKey:kUZGPlistStoreDurationKey forEpisodePath:path];
//}

- (NSUInteger)durationOfEpisodeForPath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStoreDurationKey forEpisodePath:path] unsignedIntegerValue];
}

//- (UZGEpisodeProgressStatus)playedStatusForEpisodePath:(NSString *)path;
//{
  //if ([self playedEpisodeForPath:path]) {
    //NSUInteger duration = [self durationOfEpisodeForPath:path];
    //NSUInteger progress = [self bookmarkTimeForEpisodePath:path];
    //// NSLog(@"%s - duration %d - progress %d - remaining: %d - threshold %d", __PRETTY_FUNCTION__, duration, progress, duration - progress, kUZGPlayedThresholdTime);
    //if ((duration - progress) < kUZGPlayedThresholdTime) {
      //return UZGEpisodePlayedStatus;
    //} else {
      //return UZGEpisodeUnplayedPartialStatus;
    //}
  //} else {
    //return UZGEpisodeUnplayedStatus;
  //}
//}

@end
