#import "UZGShowsListController.h"
#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"

@interface UZGShowsListController ()
@property (retain) NSString *titleInitial;
@end

@implementation UZGShowsListController

- (void)dealloc;
{
  [_titleInitial release];
  [super dealloc];
}

- (id)initWithTitleInitial:(NSString *)titleInitial;
{
  if ((self = [super init])) {
    _titleInitial = [titleInitial retain];
    self.realTitle = [NSString stringWithFormat:@"Shows: %@", _titleInitial];
  }
  return self;
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [super itemForRow:row];
  [item addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
  return item;
}

- (void)listEntrySelected:(long)row;
{
  NSDictionary *show = self.listEntries[row];
  UZGEpisodesListController *controller;
  controller = [[[UZGEpisodesListController alloc] initWithShowTitle:show[@"title"]
                                                                path:show[@"path"]] autorelease];
  [[self stack] pushController:controller];
}

- (void)fetchListEntries;
{
  [super fetchListEntries];
  [[UitzendingGemistAPIClient sharedClient] showsWithTitleInitial:self.titleInitial
                                                             page:self.currentPage
                                                          success:^(id _, id showsAndLastPage) {
    [self fetchedlistEntriesAndLastPage:showsAndLastPage];
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
