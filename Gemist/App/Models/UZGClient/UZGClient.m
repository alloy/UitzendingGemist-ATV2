#import "UZGClient.h"
#import "UZGHTMLRequestOperation.h"


static NSString * const kUitzendingGemistAPIBaseURLString = @"http://www.uitzendinggemist.nl";
static NSString * const kUitzendingGemistAPICookiesHost = @"cookies.publiekeomroep.nl";
static NSString * const kUitzendingGemistAPICookiesAcceptURLString = @"http://cookies.publiekeomroep.nl/accept/";
static NSString * const kUitzendingGemistAPIUserAgent = @"Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25";


@implementation UZGClient

+ (UZGClient *)sharedClient;
{
  static UZGClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kUitzendingGemistAPIBaseURLString]];
  });
  return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url;
{
  if ((self = [super initWithBaseURL:url])) {
    [self registerHTTPOperationClass:[UZGHTMLRequestOperation class]];
    [self setDefaultHeader:@"User-Agent" value:kUitzendingGemistAPIUserAgent];
    [self setDefaultHeader:@"Accept" value:@"text/html"];
  }
  return self;
}

// TODO check if cookie exists, if not start flow immediately and/or use setRedirectResponseBlock
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(UZGSuccessBlock)success
        failure:(UZGFailureBlock)failure;
{
  // Check if we need to go through a cookie acceptance flow. Stupid cookie law...
  UZGSuccessBlock successWrapper = ^(AFHTTPRequestOperation *operation, UZGHTMLDocument *doc) {
    NSString *host = operation.response.URL.host;
    if ([host isEqualToString:kUitzendingGemistAPICookiesHost]) {
      [self acceptCookiesWithSuccess:success failure:failure];
    } else {
      success(operation, doc);
    }
  };
  [super getPath:path
      parameters:parameters
         success:successWrapper
         failure:failure];
}

- (void)acceptCookiesWithSuccess:(UZGSuccessBlock)success
                         failure:(UZGFailureBlock)failure;
{
  //NSLog(@"-------------------------------------------------------------------");
  //NSLog(@"[!] START ACCEPT COOKIES PROCESS!");
  //NSLog(@"-------------------------------------------------------------------");
  NSURL *URL = [NSURL URLWithString:kUitzendingGemistAPICookiesAcceptURLString];
  NSURLRequest *request = [NSURLRequest requestWithURL:URL];
  [self enqueueHTTPRequestOperation:[self HTTPRequestOperationWithRequest:request
                                                                  success:success
                                                                  failure:failure]];
}

- (void)showsWithTitleInitial:(NSString *)titleInitial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)failure;
{
  if ([titleInitial isEqualToString:@"#"]) {
    titleInitial = @"0-9";
  } else {
    titleInitial = [titleInitial lowercaseString];
  }

  NSString *path = [NSString stringWithFormat:@"/programmas/%@?display_mode=detail&page=%d", titleInitial, pageNumber];
  [self getPath:path
     parameters:nil
        success:^(id operation, UZGHTMLDocument *doc) { success([doc showsPaginationDataForPage:pageNumber]); }
        failure:failure];
}

- (void)episodesOfShowAtPath:(NSString *)showPath
                        page:(NSUInteger)pageNumber
                     success:(UZGPaginationDataBlock)success
                     failure:(UZGFailureBlock)failure;
{
  NSString *path = [NSString stringWithFormat:@"%@/afleveringen?page=%d", showPath, pageNumber];
  [self getPath:path
     parameters:nil
        success:^(id operation, UZGHTMLDocument *doc) { success([doc episodesPaginationDataForPage:pageNumber]); }
        failure:failure];
}

// This takes two request, the second one is made from episodeStreamsForID:success:failure:
- (void)episodeStreamSourcesForPath:(NSString *)episodePath
                            success:(UZGSuccessBlock)success
                            failure:(UZGFailureBlock)failure;
{
  [self getPath:episodePath
     parameters:nil
        success:^(id operation, UZGHTMLDocument *doc) {
                  NSString *episodeID = [doc episodeID];
                  if (episodeID) {
                    [self episodeStreamsForID:episodeID
                                  episodePath:episodePath
                                      success:success
                                      failure:failure];
                  } else {
                    failure(operation, nil);
                  }
                }
        failure:failure];
}

- (void)episodeStreamsForID:(NSString *)ID
                episodePath:(NSString *)episodePath
                    success:(UZGSuccessBlock)success
                    failure:(UZGFailureBlock)failure;
{
  NSString *path = [NSString stringWithFormat:@"/player/%@", ID];
  [self getPath:path
     parameters:nil
        success:^(id operation, UZGHTMLDocument *doc) {
                  success(operation, [doc episodeStreamSourcesWithBaseURLString:kUitzendingGemistAPIBaseURLString]);
                }
        failure:failure];
}

@end
