#import "AFHTTPRequestOperation.h"
#import "HTMLParser.h"

@interface UZGHTMLRequestOperation : AFHTTPRequestOperation

@property (readonly, nonatomic, strong) HTMLParser *responseHTMLParser;

+ (instancetype)HTMLParserRequestOperationWithRequest:(NSURLRequest *)urlRequest
                                              success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, HTMLParser *HTMLParser))success
                                              failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, HTMLParser *HTMLParser))failure;

@end
