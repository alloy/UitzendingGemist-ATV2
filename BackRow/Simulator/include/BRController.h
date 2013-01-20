#import <UIKit/UIKit.h>

@interface BRController : UIViewController

- (id)stack;

@end

// Private implementation
@interface UINavigationController (BRController)
- (void)pushController:(BRController *)controller;
@end