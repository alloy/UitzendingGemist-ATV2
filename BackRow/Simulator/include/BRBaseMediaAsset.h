#import <Foundation/Foundation.h>

@protocol BRMediaAsset <NSObject>

@property(assign) unsigned bookmarkTimeInMS;
@property(assign) unsigned bookmarkTimeInSeconds;
@property(assign) BOOL hasBeenPlayed;
@property(retain) id lastPlayed;
@property(assign) float userStarRating;

- (id)artist;
- (id)artistCollection;
- (id)artistForSorting;
- (id)assetID;
- (id)authorName;
- (id)broadcaster;
- (BOOL)canBePlayedInShuffle;
- (id)cast;
- (id)category;
- (void)cleanUpPlaybackContext;
- (BOOL)closedCaptioned;
- (id)collections;
- (id)composer;
- (id)composerForSorting;
- (id)copyright;
- (void *)createMovieWithProperties:(void *)properties count:(long)count;
- (id)dateAcquired;
- (id)dateAcquiredString;
- (id)dateCreated;
- (id)dateCreatedString;
- (id)datePublished;
- (id)datePublishedString;
- (id)directors;
- (BOOL)dolbyDigital;
- (long)duration;
- (unsigned)episode;
- (id)episodeNumber;
- (id)genres;
- (int)grFormat;
- (BOOL)hasCoverArt;
- (BOOL)hasVideoContent;
- (id)imageProxy;
- (id)imageProxyWithBookMarkTimeInMS:(unsigned)ms;
- (void)incrementPerformanceCount;
- (void)incrementPerformanceOrSkipCount:(unsigned)count;
- (BOOL)isAvailable;
- (BOOL)isCheckedOut;
- (BOOL)isDisabled;
- (BOOL)isExplicit;
- (BOOL)isHD;
- (BOOL)isInappropriate;
- (BOOL)isLocal;
- (BOOL)isPlaying;
- (BOOL)isPlayingOrPaused;
- (BOOL)isProtectedContent;
- (BOOL)isWidescreen;
- (id)keywords;
- (id)mediaDescription;
- (id)mediaSummary;
- (id)mediaType;
- (id)mediaURL;
- (long)parentalControlRatingRank;
- (long)parentalControlRatingSystemID;
- (long)performanceCount;
- (int)physicalMediaID;
- (BOOL)playable;
- (id)playbackMetadata;
- (id)playbackRightsOwner;
- (void)preparePlaybackContext;
- (id)previewURL;
- (id)primaryCollection;
- (int)primaryCollectionOrder;
- (id)primaryCollectionTitle;
- (id)primaryCollectionTitleForSorting;
- (id)primaryGenre;
- (id)producers;
- (id)provider;
- (id)publisher;
- (id)rating;
- (id)resolution;
- (unsigned)season;
- (id)seriesName;
- (id)seriesNameForSorting;
- (void)skip;
- (id)sourceID;
- (float)starRating;
- (unsigned)startTimeInMS;
- (unsigned)startTimeInSeconds;
- (unsigned)stopTimeInMS;
- (unsigned)stopTimeInSeconds;
- (id)title;
- (id)titleForSorting;
- (id)trickPlayURL;
- (id)viewCount;
- (void)willBeDeleted;

@end

// Normally has the BRMediaAsset protocol, but I don't want to have to create
// stubs for all methods, just make your own asset subclass conform to the
// protocol.
@interface BRBaseMediaAsset : NSObject

- (id)previewURL;

@end
