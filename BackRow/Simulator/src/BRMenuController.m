#import "BRMenuController.h"
#import "BRListControl.h"

@interface BRMenuController ()

@end

@implementation BRMenuController

- (void)dealloc;
{
  [_list release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super init])) {
    _list = [BRListControl new];
  }
  return self;
}

- (void)viewDidLoad;
{
  [super viewDidLoad];
  self.list.frame = self.view.bounds;
  [self.view addSubview:self.list];
}

- (NSString *)listTitle;
{
  return self.title;
}

- (void)setListTitle:(NSString *)listTitle;
{
  self.title = listTitle;
}

@end
