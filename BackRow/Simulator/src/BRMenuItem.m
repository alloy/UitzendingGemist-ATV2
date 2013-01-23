#import "BRMenuItem.h"

@interface BRMenuItem ()
@property (retain) NSMutableArray *accessoryTypes;
@end

@implementation BRMenuItem

- (void)dealloc;
{
  [_accessoryTypes release];
  [super dealloc];
}

- (id)init;
{
  if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil])) {
    _accessoryTypes = [NSMutableArray new];
  }
  return self;
}

- (void)setText:(NSString *)text;
{
  self.textLabel.text = text;
}

- (NSString *)text;
{
  return self.textLabel.text;
}

- (void)addAccessoryOfType:(BRMenuItemAccessoryType)type;
{
  [self.accessoryTypes addObject:@(type)];
}

- (void)layoutSubviews;
{
  for (NSNumber *type in self.accessoryTypes) {
    NSLog(@"ADD TYPE: %@", type);
    switch ((BRMenuItemAccessoryType)[type intValue]) {
      case BRDisclosureMenuItemAccessoryType:
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        break;

      case BRSpinnerMenuItemAccessoryType: {
        // Why not ;)
        UIActivityIndicatorView *view = [UIActivityIndicatorView alloc];
        view = [[view initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
        self.accessoryView = view;
        [view startAnimating];
        break;
      }

      case BRUnplayedMenuItemAccessoryType:
        self.imageView.image = [UIImage backRowImageNamed:@"UIUnplayedIndicator"];
        break;

      case BRUnplayedPartialMenuItemAccessoryType:
        self.imageView.image = [UIImage backRowImageNamed:@"UIUnplayedPartialIndicator"];
        break;
    }
  }
  [super layoutSubviews];
}

@end
