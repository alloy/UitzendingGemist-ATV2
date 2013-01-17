#import "UitzendingGemistAPIClient.h"
#import "AFHTTPRequestOperation.h"

static NSString * const kUitzendingGemistAPIBaseURLString = @"http://www.uitzendinggemist.nl/";
static NSString * const kUitzendingGemistAPICookiesHost = @"cookies.publiekeomroep.nl";
static NSString * const kUitzendingGemistAPICookiesAcceptURLString = @"http://cookies.publiekeomroep.nl/accept/";
static NSString * const kUitzendingGemistAPIUserAgent = @"Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25";

typedef void (^UZGSuccessBlock)(AFHTTPRequestOperation *, id);
typedef void (^UZGFailureBlock)(AFHTTPRequestOperation *, NSError *);

@implementation UitzendingGemistAPIClient

+ (UitzendingGemistAPIClient *)sharedClient {
    static UitzendingGemistAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kUitzendingGemistAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [self setDefaultHeader:@"User-Agent" value:kUitzendingGemistAPIUserAgent];
    [self setDefaultHeader:@"Accept" value:@"text/html"];
    
    return self;
}

- (void)acceptCookies;
{
  NSLog(@"START ACCEPT COOKIES PROCESS!");
  NSURL *URL = [NSURL URLWithString:kUitzendingGemistAPICookiesAcceptURLString];
  NSURLRequest *request = [NSURLRequest requestWithURL:URL];

  UZGSuccessBlock success = ^(AFHTTPRequestOperation *acceptOperation, id data) {
    NSLog(@"RESPONSE BODY: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies) {
      NSLog(@"COOKIE: %@", cookie);
    }
  };

  UZGFailureBlock failure = ^(AFHTTPRequestOperation *_ , NSError *error) {
    NSLog(@"ERROR: %@", error);
  };

  [self enqueueHTTPRequestOperation:[self HTTPRequestOperationWithRequest:request
                                                                  success:success
                                                                  failure:failure]];
}

- (void)episodesOfShowAtPath:(NSString *)showPath page:(NSUInteger)pageNumber;
{
  NSString *path = [NSString stringWithFormat:@"%@/afleveringen?page=%d", showPath, pageNumber];
  [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, NSData *html) {
    // NSLog(@"RESPONSE BODY: %@", [[NSString alloc] initWithData:html encoding:NSUTF8StringEncoding]);
    //NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    //for (NSHTTPCookie *cookie in cookies) {
      //NSLog(@"COOKIE: %@", cookie);
    //}

    NSString *host = operation.response.URL.host;
    NSLog(@"HOST: %@", host);
    if ([host isEqualToString:kUitzendingGemistAPICookiesHost]) {
      // Need to go through cookie acceptance flow. Stupid cookie law...
      [self acceptCookies];
    }

  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"ERROR: %@", error);
  }];
}

@end
