#import <Foundation/Foundation.h>

@interface UZGPaginationData : NSObject

@property (retain) NSArray *entries;
@property (assign) NSInteger pageNumber;
@property (assign) NSInteger pageCount;

- (instancetype)initWithEntries:(NSArray *)entries
                     pageNumber:(NSInteger)pageNumber
                      pageCount:(NSInteger)pageCount;

- (instancetype)dataWithEntries:(NSArray *)entries;

@end
