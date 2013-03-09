#import "UZGSearchListController.h"


@interface UZGSearchListController ()
@property (assign) NSTimeInterval searchDelay;
@property (strong) BRTextEntryControl *textEntryControl;
@end

@implementation UZGSearchListController

// Do *not* call the super's initWithShow method.
- (instancetype)init;
{
  if ((self = [super init])) {
    _searchDelay = 3;

    // TODO argh, really need to remove this stupid realTitle property!
    self.realTitle = UZGLocalizedString(@"Search");
    _textEntryControl = [[BRTextEntryControl alloc] initWithTextEntryStyle:5];
    _textEntryControl.textFieldDelegate = self;
    dispatch_async(dispatch_get_main_queue(), ^{
      [self showTextEntryControl];
    });
  }
  return self;
}

- (void)layoutSubcontrols;
{
  [super layoutSubcontrols];

  CGRect frame = [BRWindow interfaceFrame];
  frame.size.width = 400;
  frame.origin = CGPointMake(110, 86);
  self.textEntryControl.frame = frame;
  NSLog(@"entryControlFrame: %@", NSStringFromCGRect(frame));
}

- (void)showTextEntryControl;
{
  self.list.displaysSelectionWidget = NO;
  [self clearPreviewController];
  [self addControl:self.textEntryControl];
  self.focusedControl = self.textEntryControl;
}

- (void)hideTextEntryControl;
{
  [self.textEntryControl removeFromParent];
  self.list.displaysSelectionWidget = YES;
}

- (NSString *)query;
{
  NSString *query = [(BRTextFieldControl *)self.textEntryControl.textField stringValue];
  return [query stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// TODO also cancel an on-going HTTP request operation.
- (void)textDidChange:(BRTextFieldControl *)control;
{
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(fetchAssets) object:nil];
  if (![self.query isEmpty]) {
    // Show the spinner now, even if we have an initial delay, this shows the
    // user that the input was recognized.
    self.showSpinner = YES;
    [self performSelector:@selector(fetchAssets) withObject:nil afterDelay:self.searchDelay];
  } else {
    self.showSpinner = NO;
  }
}

- (void)textDidEndEditing:(BRTextFieldControl *)control;
{
  NSLog(@"TEXT DID END EDITING: %@", control.stringValue);
}

- (void)fetchAssets;
{
  NSString *query = self.query;
  if (![query isEmpty]) {
    NSLog(@"FETCH ASSETS FOR: '%@'", query);
    //[super fetchAssets];
  }
}

//- (id)focusedControlForEvent:(id)event focusPoint:(CGPoint *)point {
	//NSLog(@"%s, %@", __PRETTY_FUNCTION__, event);

	//switch ((int)[event remoteAction]) {
			
		//case BREventRightButtonAction:
		////case kBREventRemoteActionSwipeRight:
			//// if (editorShowing == YES)
			//// {
				//// if (searchState != kNTVQueryStarted)
					//[self hideTextEntryControl];
				//// else {
					//// return nil;
				//// }

					
			//// }
			//break;
	//}
  //return [super focusedControlForEvent:event focusPoint:point];
//}

@end
