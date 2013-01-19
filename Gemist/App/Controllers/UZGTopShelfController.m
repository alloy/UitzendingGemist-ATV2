#import "UZGTopShelfController.h"

@interface UZGTopShelfController ()
@property (nonatomic, retain) BRTopShelfView *topShelfView;
@end

@implementation UZGTopShelfController

- (void)dealloc;
{
  [_topShelfView release];
  [super dealloc];
}

-(void)refresh;
{
  //needed for 4.2.1 compat to keep AppleTV.app from endless reboot cycle
}

- (void)selectCategoryWithIdentifier:(id)identifier;
{
  //leave this entirely empty for controllerForIdentifier:args to work in Appliance subclass
}

- (BRTopShelfView *)topShelfView;
{
  if (_topShelfView == nil) {
    _topShelfView = [[BRTopShelfView alloc] init];
    BRImageControl *imageControl = [_topShelfView productImage];
    //NSBundle *bundle = [[NSBundle bundleForClass:[UZGTopShelfController class];
    //BRImage *image = [BRImage imageWithPath:bundle] pathForResource:@"360iDevBanner" ofType:@"png"]];
    BRImage *image = [[BRThemeInfo sharedTheme] appleTVIconOOB];
    [imageControl setImage:image];
  }
  return _topShelfView;
}

@end
