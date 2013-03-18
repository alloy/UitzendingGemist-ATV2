#import "UZGAssetsListController.h"

@interface UZGShowsListController : UZGAssetsListController <BRMenuListItemProvider>

- (id)initWithTitleInitial:(NSString *)titleInitial
                   context:(NSManagedObjectContext *)context;

@end
