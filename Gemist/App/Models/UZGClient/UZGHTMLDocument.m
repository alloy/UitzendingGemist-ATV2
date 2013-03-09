#import "UZGHTMLDocument.h"
#import "UZGPaginationData.h"

#import "HTMLParser.h"

static NSURL *
UZGExtractThumbnailURL(HTMLNode *imageNode) {
  NSError *error = nil;
  NSString *json = [imageNode getAttributeNamed:@"data-images"];
  NSArray *sources = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                                                     options:0
                                                       error:&error];
  if (error) {
    NSLog(@"JSON parse error: %@", error);
  } else {
    if (sources.count > 0) {
      // Get one from further down in the show if available.
      NSString *source = sources.count > 1 ? sources[1] : sources[0];
      NSString *extname = [source pathExtension];
      source = [source stringByDeletingLastPathComponent];
      source = [source stringByAppendingPathExtension:extname];
      return [NSURL URLWithString:source];
    }
  }
  return nil;
}

@interface HTMLNode (UZG)
@end

@implementation HTMLNode (UZG)

- (NSArray *)findChildrenWithTagName:(NSString *)tagName
                           className:(NSString *)className;
{
  NSMutableArray *result = [NSMutableArray new];
  NSArray *nodes = [self findChildTags:tagName];
  for (HTMLNode *node in nodes) {
    NSArray *classes = [[node getAttributeNamed:@"class"] componentsSeparatedByString:@" "];
    if (classes.count > 0 && [classes indexOfObject:className] != NSNotFound) {
      [result addObject:node];
    }
  }
  return result;
}

- (HTMLNode *)findChildWithTagName:(NSString *)tagName
                         className:(NSString *)className;
{
  NSArray *nodes = [self findChildrenWithTagName:tagName className:className];
  if (nodes.count > 0) {
    return nodes[0];
  }
  return nil;
}

- (NSString *)textContents;
{
  NSMutableString *text = nil;
  for (HTMLNode *node in self.children) {
    if (node.nodetype == HTMLTextNode) {
      if (text == nil) {
        text = [NSMutableString new];
      }
      [text appendString:node.rawContents];
    }
  }
  return [text copy];
}

@end


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
  NSArray *showNodes = [self.parser.body findChildrenWithTagName:@"li" className:@"series"];
  for (HTMLNode *showNode in showNodes) {
    NSMutableDictionary *show = [NSMutableDictionary new];

    HTMLNode *thumbnailNode = [showNode findChildWithTagName:@"img" className:@"thumbnail"];
    NSURL *thumbnailURL = UZGExtractThumbnailURL(thumbnailNode);
    if (thumbnailURL) {
      show[@"previewURL"] = thumbnailURL;
    }

    HTMLNode *infoNode = [showNode findChildOfClass:@"info"];
    HTMLNode *summaryNode = [infoNode findChildWithTagName:@"div" className:@"description"];
    show[@"mediaSummary"] = [summaryNode.contents stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    HTMLNode *anchorNode = [infoNode findChildWithTagName:@"a" className:@"series"];
    show[@"title"] = anchorNode.contents;
    show[@"path"] = [anchorNode getAttributeNamed:@"href"];

    // There is a `broadcasters` property in BRMediaAsset, however, the BRMetadataControl only uses `copyright`.
    HTMLNode *broadcastersNode = [infoNode findChildWithTagName:@"span" className:@"broadcasters"];
    NSString *copyright = [[[broadcastersNode findChildTags:@"a"] valueForKey:@"contents"] componentsJoinedByString:@", "];
    if (copyright) {
      show[@"copyright"] = copyright;
    }

    [shows addObject:show];
  }
  return [[UZGPaginationData alloc] initWithEntries:shows
                                         pageNumber:pageNumber
                                          pageCount:self.pageCount];
}

#pragma mark - Episode Data

- (UZGPaginationData *)episodesPaginationDataForPage:(NSInteger)pageNumber;
{
  NSMutableArray *episodes = [NSMutableArray new];
  NSArray *episodeNodes = [self.parser.body findChildrenWithTagName:@"li" className:@"episode"];
  for (HTMLNode *episodeNode in episodeNodes) {
    NSMutableDictionary *episode = [NSMutableDictionary new];

    HTMLNode *descriptionNode = [episodeNode findChildWithTagName:@"div" className:@"description"];
    NSString *summary = descriptionNode.textContents;
    if (summary) {
      episode[@"mediaSummary"] = [summary stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }

    // This is only available in search results and recent episodes.
    HTMLNode *seriesHeadingNode = [descriptionNode findChildWithTagName:@"h3" className:@"series"];
    if (seriesHeadingNode) {
      HTMLNode *anchorNode = [seriesHeadingNode findChildTags:@"a"][0];
      episode[@"showTitle"] = [anchorNode getAttributeNamed:@"title"];
      episode[@"showPath"] = [anchorNode getAttributeNamed:@"href"];
    }

    HTMLNode *anchorNode = [descriptionNode findChildWithTagName:@"a" className:@"episode"];
    episode[@"title"] = [anchorNode getAttributeNamed:@"title"];
    episode[@"path"] = [anchorNode getAttributeNamed:@"href"];

    HTMLNode *imageNode = [episodeNode findChildWithTagName:@"img" className:@"thumbnail"];
    NSURL *thumbnailURL = UZGExtractThumbnailURL(imageNode);
    if (thumbnailURL) {
      episode[@"previewURL"] = thumbnailURL;
    }

    [episodes addObject:episode];
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
