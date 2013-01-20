#import <UIKit/UIKit.h>

@interface BRMenuItem : NSObject

@property (retain) NSAttributedString *text;

// Private UIKit implementation!
@property (assign) UITableViewCellAccessoryType accessoryType;

// type:
// 0 = none
// 1 = disclosure
// ...
// 6 = spinner
// ...
- (void)addAccessoryOfType:(int)type;

@end
