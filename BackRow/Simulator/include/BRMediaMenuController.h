#import "BRMenuController.h"

@interface BRMediaMenuController : BRMenuController

@property (assign) BOOL showSpinner;

- (void)updatePreviewController;

- (BOOL)brEventAction:(BREvent *)event;

@end
