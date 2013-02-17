#import "BRMediaMenuController.h"

@interface BRMediaMenuController ()
@property (retain) UIActivityIndicatorView *spinner;
@end

@implementation BRMediaMenuController

- (void)dealloc;
{
  [_spinner release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  }
  return self;
}

- (void)viewDidLoad;
{
  [super viewDidLoad];
  [self.view addSubview:self.spinner];
  self.spinner.center = [self.view convertPoint:self.view.center fromView:self.view];
}

- (BOOL)showSpinner;
{
  return self.spinner.isAnimating;
}

- (void)setShowSpinner:(BOOL)showSpinner;
{
  self.spinner.isAnimating ? [self.spinner stopAnimating] : [self.spinner startAnimating];
}

- (BOOL)brEventAction:(BREvent *)event;
{
  // TODO
  return YES;
}

@end
