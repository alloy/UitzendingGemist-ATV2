#import "AFHTTPClient.h"

@interface UitzendingGemistAPIClient : AFHTTPClient

+ (UitzendingGemistAPIClient *)sharedClient;

- (void)episodesOfShowAtPath:(NSString *)showPath page:(NSUInteger)pageNumber;

@end
