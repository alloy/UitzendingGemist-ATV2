#import <Foundation/Foundation.h>


@interface UZGPlistStore : NSObject

+ (NSString *)storePath;

- (NSArray *)episodePaths;
- (NSDictionary *)shows;

- (NSUInteger)bookmarkTimeForEpisodePath:(NSString *)path;
- (NSUInteger)durationOfEpisodeForPath:(NSString *)path;

@end
