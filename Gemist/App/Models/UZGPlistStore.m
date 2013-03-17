#import "UZGPlistStore.h"
// #import "UZGShowMediaAsset.h"

static NSString * const kUZGPlistStoreBookmarkTimeKey  = @"BookmarkTime";
static NSString * const kUZGPlistStoreDurationKey      = @"Duration";
static NSString * const kUZGPlistStoreEpisodesKey      = @"PlayedEpisodes";
static NSString * const kUZGPlistStorePlayedKey        = @"Played";
static NSString * const kUZGPlistStoreShowBookmarksKey = @"ShowBookmarks";


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

- (id)valueForKey:(NSString *)key forEpisodePath:(NSString *)path;
{
  // NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, key, path);
  NSDictionary *episode = self.store[kUZGPlistStoreEpisodesKey][path];
  if (episode) return episode[key];
  return nil;
}

- (NSUInteger)bookmarkTimeForEpisodePath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStoreBookmarkTimeKey forEpisodePath:path] unsignedIntegerValue];
}

- (NSUInteger)durationOfEpisodeForPath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlistStoreDurationKey forEpisodePath:path] unsignedIntegerValue];
}

@end
