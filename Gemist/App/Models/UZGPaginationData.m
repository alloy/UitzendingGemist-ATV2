#import "UZGPaginationData.h"

@implementation UZGPaginationData

- (void)dealloc;
{
  [_entries release];
  [super dealloc];
}

- (instancetype)initWithEntries:(NSArray *)entries
                     pageNumber:(NSInteger)pageNumber
                      pageCount:(NSInteger)pageCount;
{
  if ((self = [super init])) {
    _entries = [entries copy];
    _pageNumber = pageNumber;
    _pageCount = pageCount;
  }
  return self;
}

- (instancetype)dataWithEntries:(NSArray *)entries;
{
  return [[[[self class] alloc] initWithEntries:entries
                                     pageNumber:self.pageNumber
                                      pageCount:self.pageCount] autorelease];
}

@end
