#import <Foundation/Foundation.h>

@class BRImage;

@interface BRThemeInfo : NSObject

+ (BRThemeInfo *)sharedTheme;

- (BRImage *)appleTVIconOOB;

@end
