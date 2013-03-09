#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "UZGPaginationData.h"

typedef void (^UZGSuccessBlock)(AFHTTPRequestOperation *, id);
typedef void (^UZGFailureBlock)(AFHTTPRequestOperation *, NSError *);

typedef void (^UZGPaginationDataBlock)(UZGPaginationData *);

@interface UZGClient : AFHTTPClient

+ (UZGClient *)sharedClient;

// Frees list and memory and reset's shared instance state.
+ (void)cleanUp;

- (void)showsWithTitleInitial:(NSString *)titleInitial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)failure;

- (void)episodesWithSearchQuery:(NSString *)query
                           page:(NSUInteger)pageNumber
                        success:(UZGPaginationDataBlock)success
                        failure:(UZGFailureBlock)failure;

- (void)episodesOfShowAtPath:(NSString *)showPath
                        page:(NSUInteger)pageNumber
                     success:(UZGPaginationDataBlock)success
                     failure:(UZGFailureBlock)failure;

- (void)episodeStreamSourcesForPath:(NSString *)episodePath
                            success:(UZGSuccessBlock)success
                            failure:(UZGFailureBlock)failure;

@end
