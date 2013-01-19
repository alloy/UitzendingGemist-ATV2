#import <UIKit/UIKit.h>

@protocol BRAppliance <NSObject>
- (NSArray *)applianceCategories;
- (id)applianceInfo;
- (id)controllerForIdentifier:(id)identifier args:(id)args;
- (BOOL)handleObjectSelection:(id)selection userInfo:(id)info;
- (BOOL)handlePlay:(id)play userInfo:(id)info;
- (id)identifierForContentAlias:(id)contentAlias;
- (id)topShelfController;
@end

@interface BRBaseAppliance : UITableViewController <BRAppliance>

- (id)applianceName;

@end
