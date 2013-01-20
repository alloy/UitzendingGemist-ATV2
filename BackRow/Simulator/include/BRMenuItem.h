#import <UIKit/UIKit.h>

@interface BRMenuItem : NSObject

// TODO in my copy of the headers this is a NSAttributedString,
// but the headers are outdated and at runtime the ATV really
// expects a NSString...
//
// @property (retain) NSAttributedString *text;
@property (retain) NSString *text;

// Private UIKit implementation!
@property (assign) UITableViewCellAccessoryType accessoryType;

// type:
// 0 = none
// 1 = disclosure
// ...
// 6 = spinner
// ...
// 16 = not seen
// 17 = partially seen
// ...
// 26 = user photo
- (void)addAccessoryOfType:(int)type;

@end
