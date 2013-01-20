#import "UZGPlayedList.h"

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

- (void)setPlayed:(BOOL)played forEpisodePath:(NSString *)path;
{
  // NSLog(@"SET PLAYED: %d for path: %@", (int)played, path);
  self.list[path] = @(played);
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    [self.list writeToFile:self.storePath atomically:YES];
  });
}

- (BOOL)playedEpisodeForPath:(NSString *)path;
{
  return [self.list[path] boolValue];
}

@end
