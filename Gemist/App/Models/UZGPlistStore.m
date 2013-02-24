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

+ (UZGPlistStore *)sharedStore;
{
  static dispatch_once_t onceToken;
  static UZGPlistStore *sharedStore;
  dispatch_once(&onceToken, ^{
    sharedStore = [self new];
  });
  return sharedStore;
}


- (id)init;
{
  if ((self = [super init])) {
    _storePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Preferences/nl.superalloy.Gemist.plist"];
    NSMutableDictionary *store = [self loadStoreFromDisk];
    if (store) {
      _store = store;
    } else {
      _store = [NSMutableDictionary new];
      _store[kUZGPlistStoreEpisodesKey] = [NSMutableDictionary dictionary];
      _store[kUZGPlistStoreShowBookmarksKey] = [NSMutableDictionary dictionary];
    }
  }
  return self;
}

- (NSMutableDictionary *)loadStoreFromDisk;
{
  NSMutableDictionary *store = [NSMutableDictionary dictionaryWithContentsOfFile:self.storePath];
  if (store) {
    // Make recursive mutable
    for (NSString *key in [store allKeys]) {
      store[key] = [store[key] mutableCopy];
    }

    // Migrate from version where a bookmark was just: `path => title`
    NSMutableDictionary *bookmarks = store[kUZGPlistStoreShowBookmarksKey];
    for (NSString *path in [bookmarks allKeys]) {
      id bookmark = bookmarks[path];
      if ([bookmark isKindOfClass:[NSString class]]) {
        bookmarks[path] = @{ @"title":bookmark };
      } else {
        break;
      }
    }
  }
  return store;
}

- (void)saveStore;
{
  NSDictionary *store = [self.store copy];
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    [store writeToFile:self.storePath atomically:YES];
  });
}

#pragma mark - shows

- (NSArray *)allBookmarkedShows;
{
  NSDictionary *bookmarks = self.store[kUZGPlistStoreShowBookmarksKey];
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:bookmarks.count];
  NSArray *paths = [[bookmarks allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
  for (NSString *path in paths) {
    UZGShowMediaAsset *show = [[UZGShowMediaAsset alloc] initAsBookmarked];
    show.path = path;
    show.title = bookmarks[path][@"title"];
    show.mediaSummary = bookmarks[path][@"mediaSummary"];
    NSString *previewURL = bookmarks[path][@"previewURL"];
    if (previewURL) {
      show.previewURL = [NSURL URLWithString:previewURL];
    }
    [result addObject:show];
  }
  return [result copy];
}

- (BOOL)hasBookmarkedShowForPath:(NSString *)path;
{
  return self.store[kUZGPlistStoreShowBookmarksKey][path] != nil;
}

- (void)setHasBookmarkedShow:(BOOL)bookmark forPath:(NSString *)path attributes:(NSDictionary *)attributes;
{
  if (bookmark) {
    self.store[kUZGPlistStoreShowBookmarksKey][path] = attributes;
  } else {
    [self.store[kUZGPlistStoreShowBookmarksKey] removeObjectForKey:path];
  }
  [self saveStore];
}

#pragma mark - episodes

- (void)setValue:(id)value forKey:(NSString *)key forEpisodePath:(NSString *)path;
{
  // NSLog(@"%s - %@, %@, %@", __PRETTY_FUNCTION__, value, key, path);
  NSMutableDictionary *store = self.store[kUZGPlistStoreEpisodesKey];
  NSDictionary *episode = store[path];
  if (episode) {
    NSMutableDictionary *mutableEpisode = [episode mutableCopy];
    mutableEpisode[key] = value;
    store[path] = [mutableEpisode copy];
  } else {
    store[path] = @{ key:value };
  }
  [self saveStore];
}

- (id)valueForKey:(NSString *)key forEpisodePath:(NSString *)path;
{
  // NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, key, path);
  NSDictionary *episode = self.store[kUZGPlistStoreEpisodesKey][path];
  if (episode) return episode[key];
  return nil;
}

- (void)setPlayed:(BOOL)played forEpisodePath:(NSString *)path;
{
  [self setValue:@(played) forKey:kUZGPlistStorePlayedKey forEpisodePath:path];
}

- (BOOL)playedEpisodeForPath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStorePlayedKey forEpisodePath:path] boolValue];
}

- (void)setBookmarkTime:(NSUInteger)seconds forEpisodePath:(NSString *)path;
{
  [self setValue:@(seconds) forKey:kUZGPlistStoreBookmarkTimeKey forEpisodePath:path];
}

- (NSUInteger)bookmarkTimeForEpisodePath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStoreBookmarkTimeKey forEpisodePath:path] unsignedIntegerValue];
}

- (void)setDuration:(NSUInteger)seconds forEpisodePath:(NSString *)path;
{
  [self setValue:@(seconds) forKey:kUZGPlistStoreDurationKey forEpisodePath:path];
}

- (NSUInteger)durationOfEpisodeForPath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStoreDurationKey forEpisodePath:path] unsignedIntegerValue];
}

- (UZGEpisodeProgressStatus)playedStatusForEpisodePath:(NSString *)path;
{
  if ([self playedEpisodeForPath:path]) {
    NSUInteger duration = [self durationOfEpisodeForPath:path];
    NSUInteger progress = [self bookmarkTimeForEpisodePath:path];
    // NSLog(@"%s - duration %d - progress %d - remaining: %d - threshold %d", __PRETTY_FUNCTION__, duration, progress, duration - progress, kUZGPlayedThresholdTime);
    if ((duration - progress) < kUZGPlayedThresholdTime) {
      return UZGEpisodePlayedStatus;
    } else {
      return UZGEpisodeUnplayedPartialStatus;
    }
  } else {
    return UZGEpisodeUnplayedStatus;
  }
}

@end
