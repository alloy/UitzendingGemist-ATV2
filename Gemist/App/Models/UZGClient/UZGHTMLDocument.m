#import "UZGHTMLDocument.h"
#import "UZGPaginationData.h"

#import "HTMLParser.h"

static NSURL *
UZGBannerURL(NSString *URL, NSString *extension) {
  return [NSURL URLWithString:[[URL stringByAppendingPathComponent:@"720x480"] stringByAppendingPathExtension:extension]];
}

@interface UZGHTMLDocument ()
@property (strong) HTMLParser *parser;
@end

@implementation UZGHTMLDocument

+ (instancetype)documentWithData:(NSData *)data error:(NSError **)error;
{
  HTMLParser *parser = [[HTMLParser alloc] initWithData:data error:error];
  if (parser == nil || *error) {
    return nil;
  }
  return [[self alloc] initWithParser:parser];
}

- (instancetype)initWithParser:(HTMLParser *)parser;
{
  if ((self = [super init])) {
    _parser = parser;
  }
  return self;
}

- (NSInteger)pageCount;
{
  HTMLNode *paginationNode = [self.parser.body findChildOfClass:@"pagination"];
  NSArray *nodes = [paginationNode children];
  NSMutableArray *filteredNodes = [NSMutableArray new];
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

#pragma mark - Show Data

// TODO
// * the pageNumber param requirement is ugly
// * collect  metadata
- (UZGPaginationData *)showsPaginationDataForPage:(NSInteger)pageNumber;
{
  NSMutableArray *shows = [NSMutableArray new];
  NSArray *showNodes = [self.parser.body findChildrenOfClass:@"series knav_link"];
  for (HTMLNode *anchorNode in showNodes) {
    [shows addObject:@{
      @"title":anchorNode.contents,
      @"path":[anchorNode getAttributeNamed:@"href"]
    }];
  }
  return [[UZGPaginationData alloc] initWithEntries:shows
                                         pageNumber:pageNumber
                                          pageCount:self.pageCount];
}

// TODO Should we use a placeholder image when there is none?
- (NSURL *)showBannerURL;
{
  NSArray *metaNodes = [self.parser.head findChildTags:@"meta"];
  for (HTMLNode *metaNode in metaNodes) {
    if ([[metaNode getAttributeNamed:@"property"] isEqual:@"og:image"]) {
      NSString *source = [metaNode getAttributeNamed:@"content"];
      if (source) return UZGBannerURL([source stringByDeletingPathExtension], [source pathExtension]);
    }
  }
  return nil;
}

#pragma mark - Episode Data

// TODO
// * Use NSJSONThingie to decode the URLs.
// * the pageNumber param requirement is ugly
// * collect  metadata
- (UZGPaginationData *)episodesPaginationDataForPage:(NSInteger)pageNumber;
{
  NSMutableArray *episodes = [NSMutableArray new];
  NSArray *episodeNodes = [self.parser.body findChildrenOfClass:@"episode active"];
  for (HTMLNode *episodeNode in episodeNodes) {
    NSMutableDictionary *episodeData = [NSMutableDictionary new];

    HTMLNode *anchorNode = [episodeNode findChildrenOfClass:@"episode active knav_link"][0];
    episodeData[@"title"] = anchorNode.contents;
    episodeData[@"path"] = [anchorNode getAttributeNamed:@"href"];

    // Get thumbnail URL, if available.
    HTMLNode *imageNode = [episodeNode findChildrenOfClass:@"thumbnail"][0];
    NSData *imageSourcesData = [[imageNode getAttributeNamed:@"data-images"] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSArray *imageSources = [NSJSONSerialization JSONObjectWithData:imageSourcesData
                                                            options:0
                                                              error:&error];
    if (error) {
      NSLog(@"JSON parse error: %@", error);
    } else {
      if (imageSources.count > 0) {
        // Get one from further in the show if available.
        NSString *source = imageSources.count > 3 ? imageSources[3] : imageSources[1];
        episodeData[@"previewURL"] = UZGBannerURL([source stringByDeletingLastPathComponent], [source pathExtension]);
      }
    }

    [episodes addObject:episodeData];
  }

  return [[UZGPaginationData alloc] initWithEntries:episodes
                                         pageNumber:pageNumber
                                          pageCount:self.pageCount];
}

// TODO this regex is weak!
- (NSString *)episodeID;
{
  NSArray *metaNodes = [self.parser.head findChildTags:@"meta"];
  for (HTMLNode *metaNode in metaNodes) {
    if ([[metaNode getAttributeNamed:@"property"] isEqual:@"og:video"]) {
      NSError *error = nil;
      NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\w+_\\d+"
                                                                             options:NSRegularExpressionCaseInsensitive
                                                                               error:&error];
      if (error) {
        NSLog(@"Unable to create regex.");
        return nil;
      }

      NSString *swfURL = [metaNode getAttributeNamed:@"content"];
      NSRange range = [regex rangeOfFirstMatchInString:swfURL
                                               options:NSMatchingReportCompletion
                                                 range:NSMakeRange(0, [swfURL length])];
      if (range.location == NSNotFound) {
        NSLog(@"Unable to find episode ID in string: %@", swfURL);
        return nil;
      } else {
        return [swfURL substringWithRange:range];
      }
    }
  }
  return nil;
}

- (NSArray *)episodeStreamSourcesWithBaseURLString:(NSString *)baseURLString;
{
  NSArray *sourceNodes = [self.parser.body findChildTags:@"source"];
  NSMutableArray *sources = [NSMutableArray new];
  for (HTMLNode *sourceNode in sourceNodes) {
    NSString *streamPath = [sourceNode getAttributeNamed:@"src"];
    [sources addObject:[NSURL URLWithString:[baseURLString stringByAppendingString:streamPath]]];
  }
  return sources;
}

@end
