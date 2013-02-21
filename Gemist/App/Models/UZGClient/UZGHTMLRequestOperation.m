#import "UZGHTMLRequestOperation.h"

@interface UZGHTMLRequestOperation ()
@property (nonatomic, strong) UZGHTMLDocument *responseHTMLDocument;
@property (nonatomic, strong) NSError *HTMLParserError;
@end

@implementation UZGHTMLRequestOperation

+ (instancetype)HTMLParserRequestOperationWithRequest:(NSURLRequest *)urlRequest
                                              success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UZGHTMLDocument *doc))success
                                              failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, UZGHTMLDocument *doc))failure;
{
  UZGHTMLRequestOperation *requestOperation = [(UZGHTMLRequestOperation *)[self alloc] initWithRequest:urlRequest];
  [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (success) {
      success(operation.request, operation.response, responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    if (failure) {
      failure(operation.request, operation.response, error, [(UZGHTMLRequestOperation *)operation responseHTMLDocument]);
    }
  }];
  return requestOperation;
}


- (UZGHTMLDocument *)responseHTMLDocument;
{
  if (!_responseHTMLDocument && [self.responseData length] > 0 && [self isFinished]) {
    NSError *error = nil;
    _responseHTMLDocument = [UZGHTMLDocument documentWithData:self.responseData error:&error];
    self.HTMLParserError = error;
  }
  return _responseHTMLDocument;
}

- (NSError *)error {
  if (self.HTMLParserError) {
    return self.HTMLParserError;
  } else {
    return [super error];
  }
}

#pragma mark - AFHTTPRequestOperation

+ (NSSet *)acceptableContentTypes;
{
  return [NSSet setWithObjects:@"text/html", nil];
}

- (void)setCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
  self.completionBlock = ^ {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
      if (self.error) {
        if (failure) {
          dispatch_async(self.failureCallbackQueue ?: dispatch_get_main_queue(), ^{
            failure(self, self.error);
          });
        }
      } else {
        if (success) {
          UZGHTMLDocument *doc = self.responseHTMLDocument;
          dispatch_async(self.successCallbackQueue ?: dispatch_get_main_queue(), ^{
            success(self, doc);
          });
        }
      }
    });
  };
#pragma clang diagnostic pop
}

@end
