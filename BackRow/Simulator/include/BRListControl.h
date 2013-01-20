#import "BRControl.h"

@class BRMenuItem;

@protocol BRMenuListItemProvider <NSObject>
- (float)heightForRow:(long)row;
- (long)itemCount;
- (BRMenuItem *)itemForRow:(long)row;
- (BOOL)rowSelectable:(long)selectable;
- (NSString *)titleForRow:(long)row;
@end

@interface BRListControl : BRControl

@property (nonatomic, assign) id<BRMenuListItemProvider> datasource; // Yup, lowercase ‘source’

@end
