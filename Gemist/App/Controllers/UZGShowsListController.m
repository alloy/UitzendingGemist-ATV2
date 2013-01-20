#import "UZGShowsListController.h"
#import "UitzendingGemistAPIClient.h"

@interface UZGShowsListController ()
@property (retain) NSString *titleInitial;
@property (retain) NSArray *shows;
@end

@implementation UZGShowsListController

- (void)dealloc;
{
  [_titleInitial release];
  [_shows release];
  [super dealloc];
}

- (id)initWithTitleInitial:(NSString *)titleInitial;
{
  if ((self = [super init])) {
    // _shows = [@[@"Wie is de mol?", @"Keuringsdienst van Waarde", @"Foo", @"Bar", @"Baz", @"Bla", @"Boe", @"A", @"B", @"C", @"D", @"E", @"F", @"G"] retain];
    _shows = [NSArray new];
    _titleInitial = [titleInitial retain];
    self.listTitle = [NSString stringWithFormat:@"Shows: %@", self.titleInitial];
    self.list.datasource = self;
    [self fetchShows];
  }
  return self;
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  return self.shows.count;
}

- (NSString *)titleForRow:(long)row;
{
  return self.shows[row];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  NSLog(@"ITEM FOR ROW: %ld", row);
  BRMenuItem *item = [BRMenuItem new];
  item.text = [[[NSAttributedString alloc] initWithString:self.shows[row]] autorelease];
  //[menuItem setText:menuTitle withAttributes:[[BRThemeInfo sharedTheme] menuItemTextAttributes]];
  [item addAccessoryOfType:row];
  return item;
}

- (BOOL)rowSelectable:(long)selectable;
{
  return NO;
}

- (void)itemSelected:(long)selected;
{
  NSLog(@"ITEM SELECTED: %ld", selected);
}

- (void)fetchShows;
{
  NSLog(@"FETCH SHOWS!");
  self.showSpinner = YES;

  [[UitzendingGemistAPIClient sharedClient] episodesOfShowAtPath:@"programmas/2237-wie-is-de-mol"
                                                            page:1
                                                         success:^(id _, id episodes) {
    NSLog(@"%@", episodes);
    NSLog(@"QUEUE: %s", dispatch_queue_get_label(dispatch_get_current_queue()));
    self.shows = [episodes valueForKey:@"title"];
    self.showSpinner = NO;
    [self.list reload];
  }
                                                         failure:^(id _, NSError *error) {
                                                                   NSLog(@"ERROR: %@", error);
                                                                 }];
}

//- (BOOL) brEventAction:(BREvent*)event {
//	
//	NSLog(@"%s (%d): Remote action = %d", __PRETTY_FUNCTION__, __LINE__, [event remoteAction]);
//	NSLog(@"%s (%d): Remote value = %d", __PRETTY_FUNCTION__, __LINE__, [event value]);
//	NSLog(@"%s (%d): eventDictionary = %@", __PRETTY_FUNCTION__, __LINE__, [[event eventDictionary] description]);
//	
//	switch ([event remoteAction]) {
//		case BREventMenuButtonAction:
//			[[self stack] popController];
//			break;
//		case BREventOKButtonAction:
//		case BREventUpButtonAction:
//		case BREventDownButtonAction:
//		case BREventLeftButtonAction:
//		case BREventRightButtonAction:
//		case BREventPlayPauseButtonAction:
//			/* fallthrough */
//		default:
//			[super brEventAction:event];
//			break;
//	}
//	
//	return YES;
//}

@end
