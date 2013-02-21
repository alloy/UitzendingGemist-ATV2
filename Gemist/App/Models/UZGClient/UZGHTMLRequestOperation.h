#import "AFHTTPRequestOperation.h"
#import "UZGHTMLDocument.h"

@interface UZGHTMLRequestOperation : AFHTTPRequestOperation

@property (readonly, nonatomic, strong) UZGHTMLDocument *responseHTMLDocument;

+ (instancetype)HTMLParserRequestOperationWithRequest:(NSURLRequest *)urlRequest
                                              success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UZGHTMLDocument *doc))success
                                              failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, UZGHTMLDocument *doc))failure;

@end
