#import "UZGSearchListController.h"
#import "UZGEpisodeDetailViewController.h"


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
}

- (void)showTextEntryControl;
{
  [self.textEntryControl.textField setString:@"wi"];
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

// TODO is this called when the iphone remote app hits ‘return’?
- (void)textDidEndEditing:(BRTextFieldControl *)control;
{
  NSLog(@"TEXT DID END EDITING: %@", control.stringValue);
}

- (void)selectedAsset:(UZGEpisodeMediaAsset *)episode;
{
  [[self stack] pushController:[[UZGEpisodeDetailViewController alloc] initWithEpisode:episode]];
}

- (void)fetchAssets;
{
  NSString *query = self.query;
  if (![query isEmpty]) {
    [UZGEpisodeMediaAsset episodesWithSearchQuery:query
                                             page:self.currentPage
                                          success:^(UZGPaginationData *data) { [self processPaginationData:data]; }
                                          failure:^(id _, NSError *error) { [self handleError:error]; }];

  }
}

- (BOOL)brEventAction:(BREvent *)event;
{
  if (event.remoteAction == BREventMenuButtonAction && self.focusedControl == self.list) {
    [self showTextEntryControl];
    return YES;
  }
  if (event.value == 1 &&
      self.focusedControl == self.textEntryControl &&
        event.remoteAction == BREventRightButtonAction &&
          self.textEntryControl.focusIsAtRightEdge) {
    [self hideTextEntryControl];
    return YES;
  }
  return [super brEventAction:event];
}

@end
