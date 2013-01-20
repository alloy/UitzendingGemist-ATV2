#import "UZGShowsListController.h"
#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"

@interface UZGShowsListController ()
@property (retain) NSString *titleInitial;
@property (retain) NSArray *shows;
@property (assign) NSUInteger currentPage;
@property (assign) NSUInteger lastPage;
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
    _currentPage = 1;
    _lastPage = 0;
    // _shows = [@[@"Wie is de mol?", @"Keuringsdienst van Waarde", @"Foo", @"Bar", @"Baz", @"Bla", @"Boe", @"A", @"B", @"C", @"D", @"E", @"F", @"G"] retain];
    _shows = [NSArray new];
    _titleInitial = [titleInitial retain];
    self.listTitle = [NSString stringWithFormat:@"Shows: %@", self.titleInitial];
    self.list.datasource = self;
    [self fetchShows];
  }
  return self;
}

- (BOOL)showPreviousPageMenuItem;
{
  return self.currentPage > 1;
}

- (BOOL)showNextPageMenuItem;
{
  return (self.lastPage != self.currentPage);
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  NSUInteger count = self.shows.count;
  if (count == 0) return 0;

  if (self.showPreviousPageMenuItem) count++;
  if (self.showNextPageMenuItem) count++;
  return count;
}

// YES if previous, NO if next
- (BOOL)isPaginationRow:(long *)row previous:(BOOL *)previous;
{
  BOOL isPagination = NO;
  long r = *row;
  if (self.showPreviousPageMenuItem) {
    if (r == 0) {
      *previous = YES;
      isPagination = YES;
    } else if (self.showNextPageMenuItem) {
      if (r == 1) {
        *previous = NO;
        isPagination = YES;
      }
      r--;
    }
    r--;
  } else if (self.showNextPageMenuItem) {
    if (r == 0) {
      *previous = NO;
      isPagination = YES;
    }
    r--;
  }
  *row = r;
  return isPagination;
}

// TODO no idea what this is for
- (NSString *)titleForRow:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    return previous ? @"Previous Page" : @"Next Page";
  } else {
    return self.shows[row][@"title"];
  }
}

- (BRMenuItem *)itemForRow:(long)row;
{
  NSLog(@"ITEM FOR ROW: %ld", row);
  BRMenuItem *item = [BRMenuItem new];
  item.text = [self titleForRow:row];
  [item addAccessoryOfType:1];
  return item;
}

- (BOOL)rowSelectable:(long)selectable;
{
  return YES;
}

- (void)itemSelected:(long)row;
{
  BOOL previous = NO;
  if ([self isPaginationRow:&row previous:&previous]) {
    self.currentPage = self.currentPage + (previous ? -1 : +1);
    self.shows = [NSArray array];
    [self.list reload];
    [self fetchShows];
  } else {
    NSDictionary *show = self.shows[row];
    NSLog(@"ITEM SELECTED: %@", show);
    UZGEpisodesListController *controller = [[[UZGEpisodesListController alloc] initWithShowTitle:show[@"title"] path:show[@"path"]] autorelease];
    [[self stack] pushController:controller];
  }
}

- (void)fetchShows;
{
  NSLog(@"FETCH SHOWS!");
  self.showSpinner = YES;

  [[UitzendingGemistAPIClient sharedClient] showsWithTitleInitial:self.titleInitial
                                                             page:self.currentPage
                                                          success:^(id _, id showsAndLastPage) {
    NSLog(@"%@", showsAndLastPage);
    self.shows = showsAndLastPage[0];
    self.lastPage = [showsAndLastPage[1] unsignedIntegerValue];
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
