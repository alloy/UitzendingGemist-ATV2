#import <UIKit/UIKit.h>

@class BRController;

// Normally a subclass of BRControl
@interface BRControllerStack : UINavigationController

- (void)pushController:(BRController *)controller;

@end
