#import "UZGClient.h"
#import "UZGHTMLRequestOperation.h"

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
  if (filteredNodes.count == 0) {
    return 1;
  }
  HTMLNode *lastPageNode = filteredNodes[filteredNodes.count - 2];
  NSString *lastPage = [lastPageNode contents];
  return [lastPage integerValue];
}

static NSURL *
UZGBannerURL(NSString *URL, NSString *extension) {
  return [NSURL URLWithString:[[URL stringByAppendingPathComponent:@"720x480"] stringByAppendingPathExtension:extension]];
}


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
  UZGSuccessBlock successWrapper = ^(AFHTTPRequestOperation *operation, HTMLParser *parser) {
    NSString *host = operation.response.URL.host;
    if ([host isEqualToString:kUitzendingGemistAPICookiesHost]) {
      [self acceptCookiesWithSuccess:success failure:failure];
    } else {
      success(operation, parser);
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

  NSString *path = [NSString stringWithFormat:@"/programmas/%@?page=%d", titleInitial, pageNumber];
  [self getPath:path parameters:nil success:^(id operation, HTMLParser *parser) {
    // TODO:
    // * collect  metadata
    HTMLNode *bodyNode = [parser body];
    NSInteger pageCount = UZGParseLastPageFromBody(bodyNode);

    NSMutableArray *shows = [NSMutableArray array];
    NSArray *showNodes = [bodyNode findChildrenOfClass:@"series knav_link"];
    for (HTMLNode *anchorNode in showNodes) {
      [shows addObject:@{
        @"title":anchorNode.contents,
        @"path":[anchorNode getAttributeNamed:@"href"]
      }];
    }

    success([[[UZGPaginationData alloc] initWithEntries:shows
                                             pageNumber:pageNumber
                                              pageCount:pageCount] autorelease]);

  } failure:failure];
}

- (void)bannerForShowAtPath:(NSString *)showPath
                    success:(UZGSuccessBlock)success
                    failure:(UZGFailureBlock)failure;
{
  [self getPath:showPath parameters:nil success:^(id operation, HTMLParser *parser) {
    HTMLNode *headNode = [parser head];
    NSArray *metaNodes = [headNode findChildTags:@"meta"];
    for (HTMLNode *metaNode in metaNodes) {
      if ([[metaNode getAttributeNamed:@"property"] isEqual:@"og:image"]) {
        NSString *source = [metaNode getAttributeNamed:@"content"];
        // TODO Should we use a placeholder image when there is none?
        if (source) {
          NSURL *bannerURL = UZGBannerURL([source stringByDeletingPathExtension], [source pathExtension]);
          [self loadImageFromURL:bannerURL success:success failure:failure];
        }
        break;
      }
    }

  } failure:failure];
}

- (void)loadImageFromURL:(NSURL *)URL
                 success:(UZGSuccessBlock)success
                 failure:(UZGFailureBlock)failure;
{
  NSURLRequest *request = [NSURLRequest requestWithURL:URL];
  UZGSuccessBlock successWrapper = ^(AFHTTPRequestOperation *operation, id data) {
    success(operation, [BRImage imageWithData:data]);
  };
  // TODO could probably just set the accept header field to not text/html
  AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
  [operation setCompletionBlockWithSuccess:successWrapper failure:failure];
  [self enqueueHTTPRequestOperation:operation];
}

- (void)episodesOfShowAtPath:(NSString *)showPath
                        page:(NSUInteger)pageNumber
                     success:(UZGPaginationDataBlock)success
                     failure:(UZGFailureBlock)failure;
{
  NSString *path = [NSString stringWithFormat:@"%@/afleveringen?page=%d", showPath, pageNumber];
  [self getPath:path parameters:nil success:^(id operation, HTMLParser *parser) {
    // TODO:
    // * collect metadata
    HTMLNode *bodyNode = [parser body];
    NSInteger pageCount = UZGParseLastPageFromBody(bodyNode);

    NSMutableArray *episodes = [NSMutableArray array];
    NSArray *epNodes = [bodyNode findChildrenOfClass:@"episode active knav"];
    for (HTMLNode *epNode in epNodes) {
      NSMutableDictionary *episodeData = [NSMutableDictionary new];

      HTMLNode *anchorNode = [epNode findChildrenOfClass:@"episode active knav_link"][0];
      episodeData[@"title"] = anchorNode.contents;
      episodeData[@"path"] = [anchorNode getAttributeNamed:@"href"];

      // Get thumbnail URL, if available.
      HTMLNode *imageNode = [epNode findChildrenOfClass:@"thumbnail"][0];
      NSString *imageSourcesList = [imageNode getAttributeNamed:@"data-images"];
      // TODO Use NSJSONThingie
      if (![imageSourcesList isEqualToString:@"[]"]) {
        NSArray *imageSources = [imageSourcesList componentsSeparatedByString:@"\""];
        // Get one further in the show if available.
        NSString *source = imageSources.count > 3 ? imageSources[3] : imageSources[1];
        episodeData[@"previewURL"] = UZGBannerURL([source stringByDeletingLastPathComponent], [source pathExtension]);
      }

      [episodes addObject:episodeData];
      [episodeData release];
    }

    success([[[UZGPaginationData alloc] initWithEntries:episodes
                                             pageNumber:pageNumber
                                              pageCount:pageCount] autorelease]);

  } failure:failure];
}

// This takes two request, the second one is made from episodeStreamsForID:success:failure:
- (void)episodeStreamSourcesForPath:(NSString *)episodePath
                            success:(UZGSuccessBlock)success
                            failure:(UZGFailureBlock)failure;
{
  [self getPath:episodePath parameters:nil success:^(id operation, HTMLParser *parser) {
    HTMLNode *headNode = [parser head];
    NSArray *metaNodes = [headNode findChildTags:@"meta"];
    for (HTMLNode *metaNode in metaNodes) {
      if ([[metaNode getAttributeNamed:@"property"] isEqual:@"og:video"]) {
        NSString *swfURL = [metaNode getAttributeNamed:@"content"];
        NSError *error = nil;
        // Get the episode ID.
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
          failure(operation, nil); // TODO
        } else {
          NSString *ID = [swfURL substringWithRange:range];
          // NSLog(@"Parsed episode ID: %@", ID);
          [self episodeStreamsForID:ID episodePath:episodePath success:success failure:failure];
        }
        break;
      }

    }
  } failure:failure];
}

- (void)episodeStreamsForID:(NSString *)ID
                episodePath:(NSString *)episodePath
                    success:(UZGSuccessBlock)success
                    failure:(UZGFailureBlock)failure;
{
  NSString *path = [NSString stringWithFormat:@"/player/%@", ID];
  [self getPath:path parameters:nil success:^(id operation, HTMLParser *parser) {
    HTMLNode *bodyNode = [parser body];
    NSArray *sourceNodes = [bodyNode findChildTags:@"source"];
    NSMutableArray *sources = [NSMutableArray array];
    for (HTMLNode *sourceNode in sourceNodes) {
      NSString *streamPath = [sourceNode getAttributeNamed:@"src"];
      NSURL *sourceURL = [NSURL URLWithString:[kUitzendingGemistAPIBaseURLString stringByAppendingString:streamPath]];
      [sources addObject:sourceURL];
    }
    success(operation, sources);

  } failure:failure];
}

@end
