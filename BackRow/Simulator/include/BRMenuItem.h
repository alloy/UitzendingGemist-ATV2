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
// 16 = not seen
// 17 = partially seen
// ...
// 26 = user photo
- (void)addAccessoryOfType:(int)type;

@end
