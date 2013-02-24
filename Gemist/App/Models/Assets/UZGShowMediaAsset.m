#import "UZGShowMediaAsset.h"
#import "UZGEpisodeMediaAsset.h"
#import "UZGPlistStore.h"

@interface UZGShowMediaAsset ()
@property (assign) BOOL shouldLoadBookmarkedStatus;
@end

@implementation UZGShowMediaAsset

@synthesize bookmarked = _bookmarked;

+ (void)showsWithTitleInitial:(NSString *)initial
                         page:(NSUInteger)pageNumber
                      success:(UZGPaginationDataBlock)success
                      failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client showsWithTitleInitial:initial
                           page:pageNumber
                        success:^(UZGPaginationData *data) { success([self assetsWithPaginationData:data]); }
                        failure:failure];
}

- (instancetype)initAsBookmarked;
{
  if ((self = [super init])) {
    _bookmarked = YES;
    _shouldLoadBookmarkedStatus = NO;
  }
  return self;
}

- (instancetype)init;
{
  if ((self = [super init])) {
    _shouldLoadBookmarkedStatus = YES;
  }
  return self;
}

- (void)episodesAtPage:(NSInteger)pageNumber
               success:(UZGPaginationDataBlock)success
               failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client episodesOfShowAtPath:self.path
                          page:pageNumber
                       success:^(UZGPaginationData *data) { success([UZGEpisodeMediaAsset assetsWithPaginationData:data]); }
                       failure:failure];
}

- (BOOL)isBookmarked;
{
  if (self.shouldLoadBookmarkedStatus) {
    self.shouldLoadBookmarkedStatus = NO;
    _bookmarked = [[UZGPlistStore sharedStore] hasBookmarkedShowForPath:self.path];
  }
  return _bookmarked;
}

- (void)setBookmarked:(BOOL)bookmarked;
{
  if (_bookmarked != bookmarked) {
    _bookmarked = bookmarked;
    NSMutableDictionary *attributes = nil;
    if (bookmarked) {
      attributes = [NSMutableDictionary new];
      attributes[@"title"] = self.title;
      attributes[@"mediaDescription"] = self.mediaDescription;
      if (self.previewURL) attributes[@"previewURL"] = [self.previewURL absoluteString];
    }
    [[UZGPlistStore sharedStore] setHasBookmarkedShow:bookmarked
                                              forPath:self.path
                                           attributes:attributes];
  }
}

- (void)toggleBookmarked;
{
  self.bookmarked = !self.isBookmarked;
}

- (id)imageProxy;
{
  if (self.previewURL) {
    return [BRURLImageProxy proxyWithURL:self.previewURL];
  }
  return nil;
};

#pragma mark - Debug

+ (BOOL)conformsToProtocol:(Protocol *)protocol;
{
  BOOL conforms = [super conformsToProtocol:protocol];
  if (!conforms) {
    NSLog(@"Does not conform to protocol: %@", NSStringFromProtocol(protocol));
  }
  return conforms;
}

- (BOOL)conformsToProtocol:(Protocol *)protocol;
{
  BOOL conforms = [super conformsToProtocol:protocol];
  if (!conforms) {
    NSLog(@"Does not conform to protocol: %@", NSStringFromProtocol(protocol));
  }
  return conforms;
}

- (BOOL)respondsToSelector:(SEL)selector;
{
  BOOL responds = [super respondsToSelector:selector];
  if (!responds) {
    NSLog(@"Does not respond to selector: %@", NSStringFromSelector(selector));
  }
  return responds;
}


//#pragma mark - BRMediaAsset Properties

//@dynamic bookmarkTimeInMS;
//@dynamic bookmarkTimeInSeconds;
//@dynamic hasBeenPlayed;
//@dynamic lastPlayed;
//@dynamic userStarRating;

////===========================================================
////  bookmarkTimeInMS
////===========================================================
//- (unsigned)bookmarkTimeInMS
//{
  //NSLog(@"%s:    returned bookmarkTimeInMS = (null)", __FUNCTION__, bookmarkTimeInMS);
  
  //return bookmarkTimeInMS;
//}
//- (void)setBookmarkTimeInMS:(unsigned)aBookmarkTimeInMS
//{
  //NSLog(@"%s:   old value of bookmarkTimeInMS: (null), changed to: (null)", __FUNCTION__, bookmarkTimeInMS, aBookmarkTimeInMS);
  
  //if (bookmarkTimeInMS != aBookmarkTimeInMS) {
    //bookmarkTimeInMS = aBookmarkTimeInMS;
  //}
//}
////===========================================================
////  bookmarkTimeInSeconds
////===========================================================
//- (unsigned)bookmarkTimeInSeconds
//{
  //NSLog(@"%s:    returned bookmarkTimeInSeconds = (null)", __FUNCTION__, bookmarkTimeInSeconds);
  
  //return bookmarkTimeInSeconds;
//}
//- (void)setBookmarkTimeInSeconds:(unsigned)aBookmarkTimeInSeconds
//{
  //NSLog(@"%s:   old value of bookmarkTimeInSeconds: (null), changed to: (null)", __FUNCTION__, bookmarkTimeInSeconds, aBookmarkTimeInSeconds);
  
  //if (bookmarkTimeInSeconds != aBookmarkTimeInSeconds) {
    //bookmarkTimeInSeconds = aBookmarkTimeInSeconds;
  //}
//}
////===========================================================
////  hasBeenPlayed
////===========================================================
//- (BOOL)hasBeenPlayed
//{
  //NSLog(@"%s:    returned hasBeenPlayed = %@", __FUNCTION__, hasBeenPlayed ? @"YES": @"NO" );
  
  //return hasBeenPlayed;
//}
//- (void)setHasBeenPlayed:(BOOL)flag
//{
  //NSLog(@"%s:   old value of hasBeenPlayed: %@, changed to: %@", __FUNCTION__, (hasBeenPlayed ? @"YES": @"NO"), (flag ? @"YES": @"NO") );
  
  //if (hasBeenPlayed != flag) {
    //hasBeenPlayed = flag;
  //}
//}
////===========================================================
////  lastPlayed
////===========================================================
//- (id)lastPlayed
//{
  //NSLog(@"%s:    returned lastPlayed = %@", __FUNCTION__, lastPlayed);
  
  //return lastPlayed;
//}
//- (void)setLastPlayed:(id)aLastPlayed
//{
  //NSLog(@"%s:   old value of lastPlayed: %@, changed to: %@", __FUNCTION__, lastPlayed, aLastPlayed);
  
  //if (lastPlayed != aLastPlayed) {
    //lastPlayed = aLastPlayed;
  //}
//}
////===========================================================
////  userStarRating
////===========================================================
//- (float)userStarRating
//{
  //NSLog(@"%s:    returned userStarRating = %f", __FUNCTION__, userStarRating);
  
  //return userStarRating;
//}
//- (void)setUserStarRating:(float)anUserStarRating
//{
  //NSLog(@"%s:   old value of userStarRating: %f, changed to: %f", __FUNCTION__, userStarRating, anUserStarRating);
  
  //if (userStarRating != anUserStarRating) {
    //userStarRating = anUserStarRating;
  //}
//}

//#pragma mark - BRMediaAsset Methods


////===========================================================
//// - (id)artist
////
////===========================================================
//- (id)artist
//{
  
  //return <#someValue#>;
//} //artist

////===========================================================
//// - (id)artistCollection
////
////===========================================================
//- (id)artistCollection
//{
  
  //return <#someValue#>;
//} //artistCollection

////===========================================================
//// - (id)artistForSorting
////
////===========================================================
//- (id)artistForSorting
//{
  
  //return <#someValue#>;
//} //artistForSorting

////===========================================================
//// - (id)assetID
////
////===========================================================
//- (id)assetID
//{
  
  //return <#someValue#>;
//} //assetID

////===========================================================
//// - (id)authorName
////
////===========================================================
//- (id)authorName
//{
  
  //return <#someValue#>;
//} //authorName

////===========================================================
//// - (id)broadcaster
////
////===========================================================
//- (id)broadcaster
//{
  
  //return <#someValue#>;
//} //broadcaster

////===========================================================
//// - (BOOL)canBePlayedInShuffle
////
////===========================================================
//- (BOOL)canBePlayedInShuffle
//{
  
  //return <#someValue#>;
//} //canBePlayedInShuffle

////===========================================================
//// - (id)cast
////
////===========================================================
//- (id)cast
//{
  
  //return <#someValue#>;
//} //cast

////===========================================================
//// - (id)category
////
////===========================================================
//- (id)category
//{
  
  //return <#someValue#>;
//} //category

////===========================================================
//// - (void)cleanUpPlaybackContext
////
////===========================================================
//- (void)cleanUpPlaybackContext
//{
  
//} //cleanUpPlaybackContext

////===========================================================
//// - (BOOL)closedCaptioned
////
////===========================================================
//- (BOOL)closedCaptioned
//{
  
  //return <#someValue#>;
//} //closedCaptioned

////===========================================================
//// - (id)collections
////
////===========================================================
//- (id)collections
//{
  
  //return <#someValue#>;
//} //collections

////===========================================================
//// - (id)composer
////
////===========================================================
//- (id)composer
//{
  
  //return <#someValue#>;
//} //composer

////===========================================================
//// - (id)composerForSorting
////
////===========================================================
//- (id)composerForSorting
//{
  
  //return <#someValue#>;
//} //composerForSorting

////===========================================================
//// - (id)copyright
////
////===========================================================
//- (id)copyright
//{
  
  //return <#someValue#>;
//} //copyright

////===========================================================
//// - (void *)createMovieWithProperties:(void *)properties count:(long)count
////
////===========================================================
//- (void *)createMovieWithProperties:(void *)properties count:(long)count
//{
  
//} //createMovieWithProperties:count:

////===========================================================
//// - (id)dateAcquired
////
////===========================================================
//- (id)dateAcquired
//{
  
  //return <#someValue#>;
//} //dateAcquired

////===========================================================
//// - (id)dateAcquiredString
////
////===========================================================
//- (id)dateAcquiredString
//{
  
  //return <#someValue#>;
//} //dateAcquiredString

////===========================================================
//// - (id)dateCreated
////
////===========================================================
//- (id)dateCreated
//{
  
  //return <#someValue#>;
//} //dateCreated

////===========================================================
//// - (id)dateCreatedString
////
////===========================================================
//- (id)dateCreatedString
//{
  
  //return <#someValue#>;
//} //dateCreatedString

////===========================================================
//// - (id)datePublished
////
////===========================================================
//- (id)datePublished
//{
  
  //return <#someValue#>;
//} //datePublished

////===========================================================
//// - (id)datePublishedString
////
////===========================================================
//- (id)datePublishedString
//{
  
  //return <#someValue#>;
//} //datePublishedString

////===========================================================
//// - (id)directors
////
////===========================================================
//- (id)directors
//{
  
  //return <#someValue#>;
//} //directors

////===========================================================
//// - (BOOL)dolbyDigital
////
////===========================================================
//- (BOOL)dolbyDigital
//{
  
  //return <#someValue#>;
//} //dolbyDigital

////===========================================================
//// - (long)duration
////
////===========================================================
//- (long)duration
//{
  
  //return <#someValue#>;
//} //duration

////===========================================================
//// - (unsigned)episode
////
////===========================================================
//- (unsigned)episode
//{
  
  //return <#someValue#>;
//} //episode

////===========================================================
//// - (id)episodeNumber
////
////===========================================================
//- (id)episodeNumber
//{
  
  //return <#someValue#>;
//} //episodeNumber

////===========================================================
//// - (id)genres
////
////===========================================================
//- (id)genres
//{
  
  //return <#someValue#>;
//} //genres

////===========================================================
//// - (int)grFormat
////
////===========================================================
//- (int)grFormat
//{
  
  //return <#someValue#>;
//} //grFormat

////===========================================================
//// - (BOOL)hasCoverArt
////
////===========================================================
//- (BOOL)hasCoverArt
//{
  
  //return <#someValue#>;
//} //hasCoverArt

////===========================================================
//// - (BOOL)hasVideoContent
////
////===========================================================
//- (BOOL)hasVideoContent
//{
  
  //return <#someValue#>;
//} //hasVideoContent

////===========================================================
//// - (id)imageProxy
////
////===========================================================
//- (id)imageProxy
//{
  
  //return <#someValue#>;
//} //imageProxy

////===========================================================
//// - (id)imageProxyWithBookMarkTimeInMS:(unsigned)ms
////
////===========================================================
//- (id)imageProxyWithBookMarkTimeInMS:(unsigned)ms
//{
  
  //return <#someValue#>;
//} //imageProxyWithBookMarkTimeInMS:

////===========================================================
//// - (void)incrementPerformanceCount
////
////===========================================================
//- (void)incrementPerformanceCount
//{
  
//} //incrementPerformanceCount

////===========================================================
//// - (void)incrementPerformanceOrSkipCount:(unsigned)count
////
////===========================================================
//- (void)incrementPerformanceOrSkipCount:(unsigned)count
//{
  
//} //incrementPerformanceOrSkipCount:

////===========================================================
//// - (BOOL)isAvailable
////
////===========================================================
//- (BOOL)isAvailable
//{
  
  //return <#someValue#>;
//} //isAvailable

////===========================================================
//// - (BOOL)isCheckedOut
////
////===========================================================
//- (BOOL)isCheckedOut
//{
  
  //return <#someValue#>;
//} //isCheckedOut

////===========================================================
//// - (BOOL)isDisabled
////
////===========================================================
//- (BOOL)isDisabled
//{
  
  //return <#someValue#>;
//} //isDisabled

////===========================================================
//// - (BOOL)isExplicit
////
////===========================================================
//- (BOOL)isExplicit
//{
  
  //return <#someValue#>;
//} //isExplicit

////===========================================================
//// - (BOOL)isHD
////
////===========================================================
//- (BOOL)isHD
//{
  
  //return <#someValue#>;
//} //isHD

////===========================================================
//// - (BOOL)isInappropriate
////
////===========================================================
//- (BOOL)isInappropriate
//{
  
  //return <#someValue#>;
//} //isInappropriate

////===========================================================
//// - (BOOL)isLocal
////
////===========================================================
//- (BOOL)isLocal
//{
  
  //return <#someValue#>;
//} //isLocal

////===========================================================
//// - (BOOL)isPlaying
////
////===========================================================
//- (BOOL)isPlaying
//{
  
  //return <#someValue#>;
//} //isPlaying

////===========================================================
//// - (BOOL)isPlayingOrPaused
////
////===========================================================
//- (BOOL)isPlayingOrPaused
//{
  
  //return <#someValue#>;
//} //isPlayingOrPaused

////===========================================================
//// - (BOOL)isProtectedContent
////
////===========================================================
//- (BOOL)isProtectedContent
//{
  
  //return <#someValue#>;
//} //isProtectedContent

////===========================================================
//// - (BOOL)isWidescreen
////
////===========================================================
//- (BOOL)isWidescreen
//{
  
  //return <#someValue#>;
//} //isWidescreen

////===========================================================
//// - (id)keywords
////
////===========================================================
//- (id)keywords
//{
  
  //return <#someValue#>;
//} //keywords

////===========================================================
//// - (id)mediaDescription
////
////===========================================================
//- (id)mediaDescription
//{
  
  //return <#someValue#>;
//} //mediaDescription

////===========================================================
//// - (id)mediaSummary
////
////===========================================================
//- (id)mediaSummary
//{
  
  //return <#someValue#>;
//} //mediaSummary

////===========================================================
//// - (id)mediaType
////
////===========================================================
//- (id)mediaType
//{
  
  //return <#someValue#>;
//} //mediaType

////===========================================================
//// - (id)mediaURL
////
////===========================================================
//- (id)mediaURL
//{
  
  //return <#someValue#>;
//} //mediaURL

////===========================================================
//// - (long)parentalControlRatingRank
////
////===========================================================
//- (long)parentalControlRatingRank
//{
  
  //return <#someValue#>;
//} //parentalControlRatingRank

////===========================================================
//// - (long)parentalControlRatingSystemID
////
////===========================================================
//- (long)parentalControlRatingSystemID
//{
  
  //return <#someValue#>;
//} //parentalControlRatingSystemID

////===========================================================
//// - (long)performanceCount
////
////===========================================================
//- (long)performanceCount
//{
  
  //return <#someValue#>;
//} //performanceCount

////===========================================================
//// - (int)physicalMediaID
////
////===========================================================
//- (int)physicalMediaID
//{
  
  //return <#someValue#>;
//} //physicalMediaID

////===========================================================
//// - (BOOL)playable
////
////===========================================================
//- (BOOL)playable
//{
  
  //return <#someValue#>;
//} //playable

////===========================================================
//// - (id)playbackMetadata
////
////===========================================================
//- (id)playbackMetadata
//{
  
  //return <#someValue#>;
//} //playbackMetadata

////===========================================================
//// - (id)playbackRightsOwner
////
////===========================================================
//- (id)playbackRightsOwner
//{
  
  //return <#someValue#>;
//} //playbackRightsOwner

////===========================================================
//// - (void)preparePlaybackContext
////
////===========================================================
//- (void)preparePlaybackContext
//{
  
//} //preparePlaybackContext

////===========================================================
//// - (id)previewURL
////
////===========================================================
//- (id)previewURL
//{
  
  //return <#someValue#>;
//} //previewURL

////===========================================================
//// - (id)primaryCollection
////
////===========================================================
//- (id)primaryCollection
//{
  
  //return <#someValue#>;
//} //primaryCollection

////===========================================================
//// - (int)primaryCollectionOrder
////
////===========================================================
//- (int)primaryCollectionOrder
//{
  
  //return <#someValue#>;
//} //primaryCollectionOrder

////===========================================================
//// - (id)primaryCollectionTitle
////
////===========================================================
//- (id)primaryCollectionTitle
//{
  
  //return <#someValue#>;
//} //primaryCollectionTitle

////===========================================================
//// - (id)primaryCollectionTitleForSorting
////
////===========================================================
//- (id)primaryCollectionTitleForSorting
//{
  
  //return <#someValue#>;
//} //primaryCollectionTitleForSorting

////===========================================================
//// - (id)primaryGenre
////
////===========================================================
//- (id)primaryGenre
//{
  
  //return <#someValue#>;
//} //primaryGenre

////===========================================================
//// - (id)producers
////
////===========================================================
//- (id)producers
//{
  
  //return <#someValue#>;
//} //producers

////===========================================================
//// - (id)provider
////
////===========================================================
//- (id)provider
//{
  
  //return <#someValue#>;
//} //provider

////===========================================================
//// - (id)publisher
////
////===========================================================
//- (id)publisher
//{
  
  //return <#someValue#>;
//} //publisher

////===========================================================
//// - (id)rating
////
////===========================================================
//- (id)rating
//{
  
  //return <#someValue#>;
//} //rating

////===========================================================
//// - (id)resolution
////
////===========================================================
//- (id)resolution
//{
  
  //return <#someValue#>;
//} //resolution

////===========================================================
//// - (unsigned)season
////
////===========================================================
//- (unsigned)season
//{
  
  //return <#someValue#>;
//} //season

////===========================================================
//// - (id)seriesName
////
////===========================================================
//- (id)seriesName
//{
  
  //return <#someValue#>;
//} //seriesName

////===========================================================
//// - (id)seriesNameForSorting
////
////===========================================================
//- (id)seriesNameForSorting
//{
  
  //return <#someValue#>;
//} //seriesNameForSorting

////===========================================================
//// - (void)skip
////
////===========================================================
//- (void)skip
//{
  
//} //skip

////===========================================================
//// - (id)sourceID
////
////===========================================================
//- (id)sourceID
//{
  
  //return <#someValue#>;
//} //sourceID

////===========================================================
//// - (float)starRating
////
////===========================================================
//- (float)starRating
//{
  
  //return <#someValue#>;
//} //starRating

////===========================================================
//// - (unsigned)startTimeInMS
////
////===========================================================
//- (unsigned)startTimeInMS
//{
  
  //return <#someValue#>;
//} //startTimeInMS

////===========================================================
//// - (unsigned)startTimeInSeconds
////
////===========================================================
//- (unsigned)startTimeInSeconds
//{
  
  //return <#someValue#>;
//} //startTimeInSeconds

////===========================================================
//// - (unsigned)stopTimeInMS
////
////===========================================================
//- (unsigned)stopTimeInMS
//{
  
  //return <#someValue#>;
//} //stopTimeInMS

////===========================================================
//// - (unsigned)stopTimeInSeconds
////
////===========================================================
//- (unsigned)stopTimeInSeconds
//{
  
  //return <#someValue#>;
//} //stopTimeInSeconds

////===========================================================
//// - (id)title
////
////===========================================================
//- (id)title
//{
  
  //return <#someValue#>;
//} //title

////===========================================================
//// - (id)titleForSorting
////
////===========================================================
//- (id)titleForSorting
//{
  
  //return <#someValue#>;
//} //titleForSorting

////===========================================================
//// - (id)trickPlayURL
////
////===========================================================
//- (id)trickPlayURL
//{
  
  //return <#someValue#>;
//} //trickPlayURL

////===========================================================
//// - (id)viewCount
////
////===========================================================
//- (id)viewCount
//{
  
  //return <#someValue#>;
//} //viewCount

////===========================================================
//// - (void)willBeDeleted
////
////===========================================================
//- (void)willBeDeleted
//{
  
//} //willBeDeleted

@end
