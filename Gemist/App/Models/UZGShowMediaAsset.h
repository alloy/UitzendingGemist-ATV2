#import "BackRow.h"

@interface UZGShowMediaAsset : NSObject <BRMediaAsset>

@property (readonly) NSString *title;
@property (readonly) NSString *path;

- (id)initWithTitle:(NSString *)title path:(NSString *)path;

@end
