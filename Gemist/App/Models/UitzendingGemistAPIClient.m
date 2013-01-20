#import "UitzendingGemistAPIClient.h"
#import "UZGEpisodeMediaAsset.h"
#import "HTMLParser.h"


static NSString * const kUitzendingGemistAPIBaseURLString = @"http://www.uitzendinggemist.nl";
static NSString * const kUitzendingGemistAPICookiesHost = @"cookies.publiekeomroep.nl";
static NSString * const kUitzendingGemistAPICookiesAcceptURLString = @"http://cookies.publiekeomroep.nl/accept/";
static NSString * const kUitzendingGemistAPIUserAgent = @"Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25";


static NSInteger
UZGParseLastPageFromBody(HTMLNode *bodyNode) {
  HTMLNode *paginationNode = [bodyNode findChildOfClass:@"pagination"];
  NSArray *nodes = [paginationNode children];
  NSMutableArray *filteredNodes = [NSMutableArray array];
  for (HTMLNode *node in nodes) {
    if (node.nodetype != HTMLTextNode) {
      [filteredNodes addObject:node];
    }
  }
  HTMLNode *lastPageNode = filteredNodes[filteredNodes.count - 2];
  NSString *lastPage = [lastPageNode contents];
  return [lastPage integerValue];
}


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

// TODO check if cookie exists, if not start flow immediately.
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(UZGSuccessBlock)success
        failure:(UZGFailureBlock)failure;
{
  // Check if we need to go through a cookie acceptance flow. Stupid cookie law...
  UZGSuccessBlock successWrapper = ^(AFHTTPRequestOperation *operation, id data) {
    NSString *host = operation.response.URL.host;
    if ([host isEqualToString:kUitzendingGemistAPICookiesHost]) {
      [self acceptCookiesWithSuccess:success failure:failure];
    } else {
      success(operation, data);
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
  NSLog(@"-------------------------------------------------------------------");
  NSLog(@"[!] START ACCEPT COOKIES PROCESS!");
  NSLog(@"-------------------------------------------------------------------");
  NSURL *URL = [NSURL URLWithString:kUitzendingGemistAPICookiesAcceptURLString];
  NSURLRequest *request = [NSURLRequest requestWithURL:URL];
  [self enqueueHTTPRequestOperation:[self HTTPRequestOperationWithRequest:request
                                                                  success:success
                                                                  failure:failure]];
}

- (void)showsWithTitleInitial:(NSString *)titleInitial
                         page:(NSUInteger)pageNumber
                      success:(UZGSuccessBlock)success
                      failure:(UZGFailureBlock)failure;
{
  if ([titleInitial isEqualToString:@"#"]) {
    titleInitial = @"0-9";
  } else {
    titleInitial = [titleInitial lowercaseString];
  }
  NSString *path = [NSString stringWithFormat:@"/programmas/%@?page=%d", titleInitial, pageNumber];
  [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, NSData *data) {
    NSError *parseError = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithData:data error:&parseError];

    if (parseError) {
      failure(operation, parseError);
    } else {
      // TODO:
      // * collect pagination info
      // * collect thumbnail url
      // * collect datetime metadata
      HTMLNode *bodyNode = [parser body];

      // Collect show paths
      NSArray *showNodes = [bodyNode findChildrenOfClass:@"series knav_link"];
      NSMutableArray *shows = [NSMutableArray array];
      for (HTMLNode *anchorNode in showNodes) {
        [shows addObject:@{ @"title":anchorNode.contents, @"path":[anchorNode getAttributeNamed:@"href"] }];
      }

      // Collect pagination info
      NSNumber *lastPage = @(UZGParseLastPageFromBody(bodyNode));

      [parser release];
      success(operation, @[shows, lastPage]);
    }
  } failure:failure];
}

- (void)episodesOfShowAtPath:(NSString *)showPath
                        page:(NSUInteger)pageNumber
                     success:(UZGSuccessBlock)success
                     failure:(UZGFailureBlock)failure;
{
  NSString *path = [NSString stringWithFormat:@"%@/afleveringen?page=%d", showPath, pageNumber];
  [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, NSData *data) {
    NSError *parseError = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithData:data error:&parseError];

    if (parseError) {
      failure(operation, parseError);
    } else {
      // TODO:
      // * collect pagination info
      // * collect thumbnail url
      // * collect datetime metadata
      HTMLNode *bodyNode = [parser body];
      NSArray *epNodes = [bodyNode findChildrenOfClass:@"episode active knav"];
      NSMutableArray *episodes = [NSMutableArray array];
      for (HTMLNode *epNode in epNodes) {
        HTMLNode *anchorNode = [epNode findChildrenOfClass:@"episode active knav_link"][0];
        [episodes addObject:@{ @"title":anchorNode.contents, @"path":[anchorNode getAttributeNamed:@"href"] }];
      }
      [parser release];
      // NSLog(@"%@", episodes);
      success(operation, episodes);
    }
  } failure:failure];
}

// This takes two request, the second one is made from episodeStreamsForID:success:failure:
- (void)episodeStreamSourcesForPath:(NSString *)episodePath
                            success:(UZGSuccessBlock)success
                            failure:(UZGFailureBlock)failure;
{
  [self getPath:episodePath parameters:nil success:^(AFHTTPRequestOperation *operation, NSData *data) {
    NSError *parseError = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithData:data error:&parseError];

    if (parseError) {
      failure(operation, parseError);
    } else {
      // TODO:
      // * collect thumbnail url
      // * collect datetime metadata
      HTMLNode *headNode = [parser head];
      NSArray *metaNodes = [headNode findChildTags:@"meta"];
      for (HTMLNode *metaNode in metaNodes) {
        if ([[metaNode getAttributeNamed:@"property"] isEqual:@"og:video"]) {
          NSString *swfURL = [metaNode getAttributeNamed:@"content"];
          NSError *error = nil;
          // TODO this regex is weak!
          NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\w+_\\d+"
                                                                                 options:NSRegularExpressionCaseInsensitive
                                                                                   error:&error];
          if (error) {
            failure(operation, error);
            break;
          }
          NSRange range = [regex rangeOfFirstMatchInString:swfURL
                                                   options:NSMatchingReportCompletion
                                                     range:NSMakeRange(0, [swfURL length])];
          if (range.location == NSNotFound) {
            NSLog(@"Unable to find episode ID in string: %@", swfURL);
          } else {
            NSString *ID = [swfURL substringWithRange:range];
            NSLog(@"Parsed episode ID: %@", ID);
            [self episodeStreamsForID:ID success:success failure:failure];
          }
          break;
        }
      }

      [parser release];
    }
  } failure:failure];
}

- (void)episodeStreamsForID:(NSString *)ID
                    success:(UZGSuccessBlock)success
                    failure:(UZGFailureBlock)failure;
{
  NSString *path = [NSString stringWithFormat:@"/player/%@", ID];
  [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, NSData *data) {
    NSError *parseError = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithData:data error:&parseError];

    if (parseError) {
      failure(operation, parseError);
    } else {
      // TODO:
      // * collect thumbnail url
      // * collect datetime metadata
      HTMLNode *bodyNode = [parser body];
      NSArray *sourceNodes = [bodyNode findChildTags:@"source"];
      NSMutableArray *sources = [NSMutableArray array];
      for (HTMLNode *sourceNode in sourceNodes) {
        NSString *streamPath = [sourceNode getAttributeNamed:@"src"];
        NSURL *sourceURL = [NSURL URLWithString:[kUitzendingGemistAPIBaseURLString stringByAppendingString:streamPath]];
        [sources addObject:sourceURL];
      }
      [parser release];
      NSLog(@"SOURCES: %@", sources);
      UZGEpisodeMediaAsset *asset = [[[UZGEpisodeMediaAsset alloc] initWithStreamURLs:sources] autorelease];;
      success(operation, asset);
    }

  } failure:failure];
}

@end
