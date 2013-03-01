#import "UZGShowsListController.h"
#import "UZGEpisodesListController.h"
#import "UZGShowMediaAsset.h"

@interface UZGShowsListController ()
@property (strong) NSString *titleInitial;
@end

@implementation UZGShowsListController

- (id)initWithTitleInitial:(NSString *)titleInitial;
{
  if ((self = [super init])) {
    _titleInitial = titleInitial;
    self.realTitle = [NSString stringWithFormat:@"%@: %@", UZGLocalizedString(@"Shows"), _titleInitial];
  }
  return self;
}

- (BRMenuItem *)itemForAsset:(UZGShowMediaAsset *)show;
{
  BRMenuItem *item = [super itemForAsset:show];
  [item addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
  return item;
}

- (void)selectedAsset:(UZGShowMediaAsset *)show;
{
  [[self stack] pushController:[[UZGEpisodesListController alloc] initWithShow:show]];
}

- (void)fetchAssets;
{
  [super fetchAssets];
  [UZGShowMediaAsset showsWithTitleInitial:self.titleInitial
                                      page:self.currentPage
                                   success:^(UZGPaginationData *data) { [self processPaginationData:data]; }
                                   failure:^(id _, NSError *error) { [self handleError:error]; }];
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
