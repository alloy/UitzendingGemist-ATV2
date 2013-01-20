#import "UZGShowsListController.h"
#import "UZGEpisodesListController.h"
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

// TODO no idea what this is for
- (NSString *)titleForRow:(long)row;
{
  return self.shows[row][@"title"];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  NSLog(@"ITEM FOR ROW: %ld", row);
  BRMenuItem *item = [BRMenuItem new];
  item.text = self.shows[row][@"title"];
  //item.text = [[[NSAttributedString alloc] initWithString:self.shows[row][@"title"]] autorelease];
  //[menuItem setText:menuTitle withAttributes:[[BRThemeInfo sharedTheme] menuItemTextAttributes]];
  [item addAccessoryOfType:1];
  return item;
}

- (BOOL)rowSelectable:(long)selectable;
{
  return YES;
}

- (void)itemSelected:(long)selected;
{
  NSDictionary *show = self.shows[selected];
  NSLog(@"ITEM SELECTED: %@", show);
  UZGEpisodesListController *controller = [[[UZGEpisodesListController alloc] initWithShowTitle:show[@"title"] path:show[@"path"]] autorelease];
  [[self stack] pushController:controller];
}

- (void)fetchShows;
{
  NSLog(@"FETCH SHOWS!");
  self.showSpinner = YES;

  [[UitzendingGemistAPIClient sharedClient] showsWithTitleInitial:self.titleInitial
                                                            page:1
                                                         success:^(id _, id shows) {
    NSLog(@"%@", shows);
    self.shows = shows;
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
