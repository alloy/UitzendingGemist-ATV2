#import <Foundation/Foundation.h>

@interface BRApplianceCategory : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) float preferredOrder;

+ (id)categoryWithName:(NSString *)name identifier:(NSString *)identifier preferredOrder:(float)order;

@end
