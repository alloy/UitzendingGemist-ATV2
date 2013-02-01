#import "BRControl.h"

@class BRMenuItem;

@protocol BRMenuListItemProvider <NSObject>
- (float)heightForRow:(long)row;
- (long)itemCount;
- (BRMenuItem *)itemForRow:(long)row;
- (BOOL)rowSelectable:(long)row;
// TODO what is this used for?
- (NSString *)titleForRow:(long)row;

// NOTE: Not technically part of the protocol, but seems to be the method that
// is supposed to be called when a list item is selected, so putting it here
// for clarification purpose.
- (void)itemSelected:(long)row;

@end

@interface BRListControl : BRControl

@property (nonatomic, assign) id<BRMenuListItemProvider> datasource; // Yup, lowercase ‘source’

- (void)reload;

@end
