#import "BackRow.h"

@interface UZGBaseListController : BRMediaMenuController <BRMenuListItemProvider>

@property (nonatomic, retain) NSArray *listEntries;
@property (nonatomic, retain) NSString *realTitle;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger lastPage;

- (void)fetchListEntries;
- (void)listEntrySelected:(long)row;
- (void)fetchedlistEntriesAndLastPage:(NSArray *)listEntriesAndLastPage;
- (BOOL)isPaginationRow:(long *)row previous:(BOOL *)previous;
- (void)addDisclosureAccessoryToPaginationItem:(BRMenuItem *)item row:(long)row;

@end
