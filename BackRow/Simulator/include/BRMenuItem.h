#import <Foundation/Foundation.h>

@interface BRMenuItem : NSObject

@property (retain) NSAttributedString *text;

// type:
// 0 = none
// 1 = disclosure
// ...
// 6 = spinner
// ...
- (void)addAccessoryOfType:(int)type;

@end
