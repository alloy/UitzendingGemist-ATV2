#import <Foundation/Foundation.h>

@interface UZGPlayedList : NSObject

+ (UZGPlayedList *)sharedList;

- (void)setPlayed:(BOOL)played forEpisodePath:(NSString *)path;
- (BOOL)playedEpisodeForPath:(NSString *)path;

@end
