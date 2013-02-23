#import <Foundation/Foundation.h>

@class UZGPaginationData;

@interface UZGHTMLDocument : NSObject

@property (readonly) NSInteger pageCount;

+ (instancetype)documentWithData:(NSData *)data error:(NSError **)error;

- (UZGPaginationData *)showsPaginationDataForPage:(NSInteger)pageNumber;

- (UZGPaginationData *)episodesPaginationDataForPage:(NSInteger)pageNumber;
- (NSString *)episodeID;
- (NSArray *)episodeStreamSourcesWithBaseURLString:(NSString *)baseURLString;

@end
