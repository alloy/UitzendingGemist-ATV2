#import "UZGPlayedList.h"

static NSString * const kUZGPlayedListBookmarkTimeKey = @"BookmarkTime";
static NSString * const kUZGPlayedListDurationKey     = @"Duration";
static NSString * const kUZGPlayedListPlayedKey       = @"Played";

// Consider it played if within the lst 5 minutes.
static const NSUInteger kUZGPlayedThresholdTime = 5 * 60;

@interface UZGPlayedList ()
@property (retain) NSString *storePath;
@property (retain) NSMutableDictionary *list;
@end

@implementation UZGPlayedList

+ (UZGPlayedList *)sharedList;
{
  static dispatch_once_t onceToken;
  static UZGPlayedList *sharedList;
  dispatch_once(&onceToken, ^{
    sharedList = [self new];
  });
  return sharedList;
}

- (void)dealloc;
{
  [_storePath release];
  [_list release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _storePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Preferences/nl.superalloy.Gemist.plist"] retain];
    // NSLog(@"STORE PATH: %@", _storePath);
    NSMutableDictionary *list = [NSMutableDictionary dictionaryWithContentsOfFile:_storePath];
    // NSLog(@"LIST FROM DISK: %@", list);
    if (list) {
      _list = [list retain];
    } else {
      _list = [NSMutableDictionary new];
    }
    // NSLog(@"LIST IN MEMORY: %@", _list);
  }
  return self;
}

- (void)setValue:(id)value forKey:(NSString *)key forEpisodePath:(NSString *)path;
{
  // NSLog(@"%s - %@, %@, %@", __PRETTY_FUNCTION__, value, key, path);
  NSDictionary *episode = self.list[path];
  if (episode) {
    NSMutableDictionary *mutableEpisode = [[episode mutableCopy] autorelease];
    mutableEpisode[key] = value;
    self.list[path] = [[mutableEpisode copy] autorelease];
  } else {
    self.list[path] = @{ key:value };
  }

  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    [self.list writeToFile:self.storePath atomically:YES];
  });
}

- (id)valueForKey:(NSString *)key forEpisodePath:(NSString *)path;
{
  NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, key, path);
  NSDictionary *episode = self.list[path];
  if (episode) return episode[key];
  return nil;
}

- (void)setPlayed:(BOOL)played forEpisodePath:(NSString *)path;
{
  [self setValue:@(played) forKey:kUZGPlayedListPlayedKey forEpisodePath:path];
}

- (BOOL)playedEpisodeForPath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlayedListPlayedKey forEpisodePath:path] boolValue];
}

- (void)setBookmarkTime:(NSUInteger)seconds forEpisodePath:(NSString *)path;
{
  [self setValue:@(seconds) forKey:kUZGPlayedListBookmarkTimeKey forEpisodePath:path];
}

- (NSUInteger)bookmarkTimeForEpisodePath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlayedListBookmarkTimeKey forEpisodePath:path] unsignedIntegerValue];
}

- (void)setDuration:(NSUInteger)seconds forEpisodePath:(NSString *)path;
{
  [self setValue:@(seconds) forKey:kUZGPlayedListDurationKey forEpisodePath:path];
}

- (NSUInteger)durationOfEpisodeForPath:(NSString *)path;
{
  return [[self valueForKey:kUZGPlayedListDurationKey forEpisodePath:path] unsignedIntegerValue];
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
