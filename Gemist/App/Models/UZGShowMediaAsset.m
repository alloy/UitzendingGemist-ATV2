#import "UZGShowMediaAsset.h"

@implementation UZGShowMediaAsset

- (void)dealloc;
{
  [_title release];
  [_path release];
  [super dealloc];
}

- (id)initWithTitle:(NSString *)title path:(NSString *)path;
{
  if ((self = [super init])) {
    _title = [title retain];
    _path = [path retain];
  }
  return self;
}

#pragma mark - Actually implemented

- (id)mediaType;
{
  return [BRMediaType TVShow];
}

- (id)assetID {
  return self.path;
};

#pragma mark BRMediaPreviewFactoryDelegate

- (BOOL)mediaPreviewShouldShowMetadata{ 
  return YES;
}
- (BOOL)mediaPreviewShouldShowMetadataImmediately{ 
  return YES;
}

#pragma mark BRMediaAsset

- (id)provider {
  return nil;
}

- (id)titleForSorting {
  return @"360iDev Sample Video";
};

-(id)title {
  return @"360iDev Sample Video";
}

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

- (id)copyright {
  return nil;
};

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

- (id)previewURL {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  [super previewURL];
  //NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
  //return [NSURL fileURLWithPath:moviePosterPath];
  return nil;
};
- (id)trickPlayURL {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  return nil;
};
- (id)imageProxy {
  // NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  return nil;
  //NSString* moviePosterPath = [[NSBundle bundleForClass:[SampleVideoAsset class]] pathForResource:@"spiderman-poster" ofType:@"png"];
  //return [BRURLImageProxy proxyWithURL:[[NSURL fileURLWithPath:moviePosterPath] absoluteString]];
};

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

- (BOOL)hasBeenPlayed;
{
  return NO;
}

- (void)setHasBeenPlayed:(BOOL)played;
{
}

- (NSUInteger)duration;
{
  return 0;
}

- (void)setDuration:(NSUInteger)duration;
{
}

- (void)setBookmarkTimeInSeconds:(unsigned int)seconds;
{
}

- (unsigned int)bookmarkTimeInSeconds;
{
  return 0;
}

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
- (id)mediaURL;
{
  return nil;
}
- (id)mediaDescription {
  return nil;
};
- (id)mediaSummary {
  return nil;
};
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