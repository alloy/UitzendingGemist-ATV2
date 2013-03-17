#import "BackRow.h"

@interface UZGBaseListController : BRMediaMenuController

@property (strong) NSManagedObjectContext *managedObjectContext;

- (instancetype)initWithContext:(NSManagedObjectContext *)context;

@end
