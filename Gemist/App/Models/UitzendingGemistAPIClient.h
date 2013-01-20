#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

typedef void (^UZGSuccessBlock)(AFHTTPRequestOperation *, id);
typedef void (^UZGFailureBlock)(AFHTTPRequestOperation *, NSError *);

@interface UitzendingGemistAPIClient : AFHTTPClient

+ (UitzendingGemistAPIClient *)sharedClient;

- (void)showsWithTitleInitial:(NSString *)titleInitial
                         page:(NSUInteger)pageNumber
                      success:(UZGSuccessBlock)success
                      failure:(UZGFailureBlock)failure;

- (void)episodesOfShowAtPath:(NSString *)showPath
                        page:(NSUInteger)pageNumber
                     success:(UZGSuccessBlock)success
                     failure:(UZGFailureBlock)failure;

- (void)episodeStreamSourcesForPath:(NSString *)episodePath
                            success:(UZGSuccessBlock)success
                            failure:(UZGFailureBlock)failure;

@end
