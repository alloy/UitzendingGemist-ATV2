#import "UZGShowsListController.h"

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
    _shows = [@[@"Wie is de mol?", @"Keuringsdienst van Waarde"] retain];
    _titleInitial = [titleInitial retain];
    self.listTitle = [NSString stringWithFormat:@"Shows: %@", self.titleInitial];
    self.list.datasource = self;
  }
  return self;
}

//- (float)heightForRow:(long)row;
//{
  //return 100;
//}

- (long)itemCount;
{
  return self.shows.count;
}

- (NSString *)titleForRow:(long)row;
{
  return self.shows[row];
}

- (id)itemForRow:(long)row;
{
  NSLog(@"ITEM FOR ROW: %ld", row);
  return nil;
}

- (BOOL)rowSelectable:(long)selectable;
{
  return NO;
}

- (void)itemSelected:(long)selected;
{
  NSLog(@"ITEM SELECTED: %ld", selected);
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
