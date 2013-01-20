#import "BRController.h"

@interface BRAlertController : BRController

// type:
// 0 = without warning sign
// 2 = with warning sign
+ (id)alertOfType:(int)type titled:(id)titled primaryText:(id)text secondaryText:(id)text4;

@end
