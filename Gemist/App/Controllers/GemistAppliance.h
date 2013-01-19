#import "BackRow.h"

@class UZGTopShelfController;

@interface GemistAppliance : BRBaseAppliance <BRAppliance>

@property (nonatomic, retain) UZGTopShelfController *topShelfController;
@property (nonatomic, retain) NSArray *applianceCategories;

@end
