#import "UZGEpisodeMediaAsset.h"
#import "UZGShowMediaAsset.h"

// Consider it played if within the lst 5 minutes.
static const NSUInteger kUZGPlayedThresholdTime = 5 * 60;

@interface UZGEpisodeMediaAsset (PrimitiveAccessors)
@property (strong) NSNumber *primitiveDuration;
@property (strong) NSNumber *primitiveBookmarkTimeInSeconds;
@end

@implementation UZGEpisodeMediaAsset

@dynamic hasFinishedPlaying;

// TODO no idea why I suddenly have to synthesize these since using Core Data...
@synthesize mediaURL = _mediaURL, show = _show, showPath = _showPath, showTitle = _showTitle;
@synthesize title = _title, previewURLString = _previewURLString, mediaSummary = _mediaSummary, copyright = _copyright;

+ (void)episodesWithSearchQuery:(NSString *)query
                        context:(NSManagedObjectContext *)context
                           page:(NSUInteger)pageNumber
                        success:(UZGPaginationDataBlock)success
                        failure:(UZGFailureBlock)failure;
{
  UZGClient *client = [UZGClient sharedClient];
  [client episodesWithSearchQuery:query
                             page:pageNumber
                          success:^(UZGPaginationData *data) { success([self assetsWithPaginationData:data context:context]); }
                          failure:failure];
}

- (unsigned int)duration;
{
  [self willAccessValueForKey:@"duration"];
  NSNumber *duration = self.primitiveDuration;
  [self didAccessValueForKey:@"duration"];
  return duration == nil ? 0 : duration.unsignedIntValue;
}

- (void)setDuration:(unsigned int)duration;
{
  NSNumber *number = @(duration);
  [self willChangeValueForKey:@"duration"];
  self.primitiveDuration = number;
  [self didChangeValueForKey:@"duration"];
}

- (unsigned int)bookmarkTimeInSeconds;
{
  [self willAccessValueForKey:@"bookmarkTimeInSeconds"];
  NSNumber *bookmarkTimeInSeconds = self.primitiveBookmarkTimeInSeconds;
  [self didAccessValueForKey:@"bookmarkTimeInSeconds"];
  return bookmarkTimeInSeconds == nil ? 0 : bookmarkTimeInSeconds.unsignedIntValue;
}

- (void)setBookmarkTimeInSeconds:(unsigned int)bookmarkTimeInSeconds;
{
  NSNumber *number = @(bookmarkTimeInSeconds);
  [self willChangeValueForKey:@"bookmarkTimeInSeconds"];
  self.primitiveBookmarkTimeInSeconds = number;
  [self didChangeValueForKey:@"bookmarkTimeInSeconds"];
}

- (UZGShowMediaAsset *)show;
{
  if (_show == nil) {
    NSParameterAssert(self.showTitle);
    NSParameterAssert(self.showPath);
    _show = [[UZGShowMediaAsset alloc] initWithTitle:self.showTitle path:self.showPath];
  }
  return _show;
}

- (UZGEpisodeProgressStatus)progressStatus;
{
  if (self.hasFinishedPlaying) {
    return UZGEpisodePlayedStatus;
  }
  if (self.bookmarkTimeInSeconds > 0) {
    // TODO return played status when hasBeenPlayed is 
    if (self.duration > 0 && (self.duration - self.bookmarkTimeInSeconds) < kUZGPlayedThresholdTime) {
      return UZGEpisodePlayedStatus;
    } else {
      return UZGEpisodeUnplayedPartialStatus;
    }
  } else {
    return UZGEpisodeUnplayedStatus;
  }
}

- (BOOL)hasBeenPlayed;
{
  return NO;
}

- (void)setHasBeenPlayed:(BOOL)played;
{
  NSLog(@"Has been played: %d, %s", (int)played, dispatch_queue_get_label(dispatch_get_current_queue()));
  if (played && self.duration == 0) {
    BRMediaPlayer *player = [[BRMediaPlayerManager singleton] activePlayer];
    NSLog(@"PLAYER: %@", player);
    self.duration = (int64_t)roundf(player.duration);
    NSLog(@"DURATION: %d", (int)self.duration);
    if (self.managedObjectContext == nil) {
      NSAssert(self.insertIntoContext != nil, @"Should have a context!");
      NSLog(@"INSERT!");
      [self.insertIntoContext insertObject:self];
    }
  }
}

// TODO how do we provide the other streams so the player can be adaptive?
- (void)withMediaURL:(dispatch_block_t)success failure:(UZGFailureBlock)failure;
{
  if (self.mediaURL) {
    success();
    return;
  }
  UZGClient *client = [UZGClient sharedClient];
  [client episodeStreamSourcesForPath:self.path
                              success:^(id _, NSArray *sources) { self.mediaURL = [sources[0] absoluteString]; success(); }
                              failure:failure];
}

#pragma mark - BRMediaAsset

// TODO Check if this is really required for an episode to be accepted by the
// playback manager, because this breaks our custom metadata preview control.
//
// This controls the way in which BRMetadataControl displays the metadata.
- (id)mediaType;
{
  return [BRMediaType TVShow];
}

// TODO how do we provide the other streams so the player can be adaptive?
//- (id)mediaURL;
//{
  //NSURL *highQuality = self.streamURLs[0];
  //return [highQuality absoluteString];
//}

#pragma mark BRMediaPreviewFactoryDelegate

- (BOOL)mediaPreviewShouldShowMetadata{ 
  return YES;
}
- (BOOL)mediaPreviewShouldShowMetadataImmediately{ 
  return YES;
}

#pragma mark BRMediaObject

- (BOOL)isValid;
{
  return YES;
}

- (id)mediaObjectID;
{
  return nil;
}

- (void)performSelector:(SEL)arg1 target:(id)arg2;
{
  NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, NSStringFromSelector(arg1), arg2);
}

- (void)performSelector:(SEL)arg1 target:(id)arg2 withObject:(id)arg3;
{
  NSLog(@"%s - %@, %@, %@", __PRETTY_FUNCTION__, NSStringFromSelector(arg1), arg2, arg3);
}

#pragma mark BRMediaAsset

// new required methods

- (BOOL)alwaysRequiresAuthorization;
{
  return NO;
}

- (BOOL)forceHDCPProtection;
{
  return NO;
}

- (id)startDate;
{
  return nil;
}

- (void *)createMovieWithProperties:(void *)arg1 count:(long)arg2;
{
  // no-op
  NSLog(@"%s", __PRETTY_FUNCTION__);
  return NULL;
}

// TODO interesting?
- (unsigned int)episode;
{
  return 1;
}

- (id)episodeNumber;
{
  return nil;
}

- (id)mediaFlavor;
{
  return nil;
}

// TODO interesting?
- (unsigned int)season;
{
  return 1;
}

- (void)setPlaybackMetadataValue:(id)arg1 forKey:(id)arg2;
{
  NSLog(@"%s - %@, %@", __PRETTY_FUNCTION__, arg1, arg2);
}

- (id)trickPlayConfig;
{
  return nil;
}

- (void)willBeginPlayback;
{
  // no-op
}

- (id)merchant;
{
  return nil;
}

// old uncleaned
//
// TODO cleanup

- (id)provider {
  return nil;
}

- (id)assetID {
  return @"1234";
};

- (id)titleForSorting {
  return @"360iDev Sample Video";
};

//-(id)title {
//  return @"360iDev Sample Video";
//}

- (id)artist {
  return @"Sony Pictures";
};

- (id)artistForSorting {
  return @"Sony Pictures";
};

- (id)AlbumName {
  return @"Album Name";
};

- (id)AlbumID {
  return @"1234";
}

- (id)TrackNum {
  return @"1";
};

- (id)composer {
  return nil;
};

- (id)composerForSorting {
  return nil;
};

//- (id)copyright {
  //return nil;
//};

- (void)setUserStarRating:(float)fp8 {
  
};

- (float)starRating {
  return 4;
};

- (BOOL)isHD {
  return NO;
};

- (BOOL)isWidescreen {
  return YES;
};

- (BOOL)closedCaptioned {
  return NO;
};

- (BOOL)dolbyDigital {
  return NO;
};

- (long)performanceCount {
  return 1;
};

- (void)incrementPerformanceCount {
  
};

- (void)incrementPerformanceOrSkipCount:(unsigned int)fp8 {
  
};

//- (id)previewURL {
  //// NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  //// [super previewURL];
  ////NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
  ////return [NSURL fileURLWithPath:moviePosterPath];
  //return nil;
//};
- (id)trickPlayURL {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  return nil;
};
//- (id)imageProxy {
  //// NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  //return nil;
  ////NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
  ////return [BRURLImageProxy proxyWithURL:[[NSURL fileURLWithPath:moviePosterPath] absoluteString]];
//};

- (id)imageProxyWithBookMarkTimeInMS:(unsigned int)fp8 {  
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  return nil;
  //NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
  //return [BRURLImageProxy proxyWithURL:[[NSURL fileURLWithPath:moviePosterPath] absoluteString]];
};
- (BOOL)hasCoverArt {
  return YES;
};
- (BOOL)isProtectedContent {
  return NO;
};
- (id)playbackRightsOwner {
  return nil;
};
- (BOOL)isDisabled {
  return NO;
};
- (id)collections {
  return nil;
};
- (id)primaryCollection {
  return nil;
};
- (id)artistCollection {
  return nil;
};
- (id)primaryCollectionTitle {
  return @"The Amazing Spider-Man";
};
- (id)primaryCollectionTitleForSorting {
  return nil;
};
- (int)primaryCollectionOrder {
  return 0;
};
- (int)physicalMediaID {
  return 0;
};
- (id)seriesName {
  return @"seriesName";
};
- (id)seriesNameForSorting {
  return nil;
};
- (id)broadcaster {
  return nil;
};

- (id)genres {
  return nil;
};
- (id)dateAcquired {
  return nil;
};
- (id)dateAcquiredString {
  return nil;
};
- (id)dateCreated {
  return nil;
};
- (id)dateCreatedString {
  return nil;
};
- (id)datePublishedString {
  return nil;
};
- (void)setBookmarkTimeInMS:(unsigned int)fp8 {
  NSLog(@"%s - %d", __PRETTY_FUNCTION__, fp8);
};
- (unsigned int)bookmarkTimeInMS {
  return 1;
};
- (unsigned int)startTimeInMS {
  return 1;
};
- (unsigned int)startTimeInSeconds {
  return 1;
};
- (unsigned int)stopTimeInMS {
  return 1;
};
- (unsigned int)stopTimeInSeconds {
  return 1;
};
- (id)lastPlayed {
  return nil;
};
- (void)setLastPlayed:(id)fp8 {
  
};
- (id)resolution {
  return nil;
};
- (BOOL)canBePlayedInShuffle {
  return YES;
};
- (BOOL)isLocal {
  return NO;
};
- (BOOL)isAvailable {
  return YES;
};
- (void)skip {
  
};
- (id)authorName {
  return nil;
};
- (id)keywords {
  return nil;
};
- (id)viewCount {
  return nil;
};
- (id)category {
  return nil;
};
- (BOOL)isInappropriate; {
  return NO;
}
- (int)grFormat {
  return 1;
};
- (void)willBeDeleted {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
};
- (void)preparePlaybackContext{
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
};

- (void)cleanUpPlaybackContext {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
};

- (long)parentalControlRatingSystemID {
  return 1;
};
- (long)parentalControlRatingRank {
  return 1;
};
- (BOOL)isExplicit {
  return NO;
};
- (BOOL)playable {
  return YES;
};
- (id)playbackMetadata {
  return nil;
};
/*
 - (void *)createMovieWithProperties:(void *)fp8 count:(long)fp12 {
 NSLog(@"createMovieWithProperties");
 };
 */
- (BOOL)isCheckedOut {
  return YES;
};
- (id)sourceID {
  return nil;
};
- (BOOL)isPlaying {
  return NO;
};
- (BOOL)isPlayingOrPaused {
  return NO;
};
- (id)publisher {
  return nil;
};
- (id)rating {
  return nil;
};
- (id)mediaDescription {
  return nil;
};
//- (id)mediaSummary {
  //return nil;
//};
- (id)primaryGenre {
  return nil;
};
- (id)datePublished {
  return nil;
};
- (float)userStarRating {
  return 2;
};
- (id)cast {
  return nil;
};
- (id)directors {
  return nil;
};
- (id)producers {
  return nil;
};
- (BOOL)hasVideoContent {
  return YES;
};

#pragma mark BRImageProvider

- (NSString*) imageID { 
  return nil;
}

// BRImageLoader *loader
- (void)registerAsPendingImageProvider:(id)loader {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
}

- (void)loadImage:(id)loader{
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
}


@end
