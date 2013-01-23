#import <UIKit/UIKit.h>
#import "BackRow+Constants.h"

@interface BRMenuItem : UITableViewCell

// TODO in my copy of the headers this is a NSAttributedString,
// but the headers are outdated and at runtime the ATV really
// expects a NSString...
//
// @property (retain) NSAttributedString *text;
@property (retain) NSString *text;

- (void)addAccessoryOfType:(BRMenuItemAccessoryType)type;

@end
