#import "UZGShowsListController.h"
#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"
#import "UZGShowMediaAsset.h"

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
    self.realTitle = [NSString stringWithFormat:@"%@: %@", UZGLocalizedString(@"Shows"), _titleInitial];
  }
  return self;
}

- (id)previewControlForItem:(long)row;
{
  if (![self isPaginationRow:&row previous:NULL]) {
    BRImage *bannerImage = self.bannerCache[@(row)];
    if (bannerImage) {
      BRImageAndSyncingPreviewController *controller = [[BRImageAndSyncingPreviewController new] autorelease];
      [controller setReflectionAmount:0.5];
      controller.image = bannerImage;
      return controller;

    } else {
      UZGShowMediaAsset *show = self.assets[row];
      [[UitzendingGemistAPIClient sharedClient] bannerForShowAtPath:show.path
                                                            success:^(id _, id bannerImage) {
        self.bannerCache[@(row)] = bannerImage;
        [self updatePreviewController];
      }
                                                            failure:^(id _, NSError *error) {
                                                                        NSLog(@"ERROR: %@", error);
                                                                    }];
    }
  }
  return nil;
}

- (BRMenuItem *)itemForRow:(long)row;
{
  BRMenuItem *item = [super itemForRow:row];
  [item addAccessoryOfType:BRDisclosureMenuItemAccessoryType];
  return item;
}

- (void)selectedAsset:(long)row;
{
  UZGShowMediaAsset *show = self.assets[row];
  UZGEpisodesListController *controller;
  controller = [[[UZGEpisodesListController alloc] initWithShowTitle:show.title
                                                                path:show.path] autorelease];
  [[self stack] pushController:controller];
}

- (void)fetchAssets;
{
  [super fetchAssets];
  [[UitzendingGemistAPIClient sharedClient] showsWithTitleInitial:self.titleInitial
                                                             page:self.currentPage
                                                          success:^(id _, id showsAndLastPage) {
    [self fetchedAssetsAndLastPage:showsAndLastPage];
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
