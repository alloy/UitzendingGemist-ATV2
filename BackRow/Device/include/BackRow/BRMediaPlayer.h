//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRTransportDataProvider-Protocol.h"

@class NSMutableArray;
@protocol BRPlayerDelegate;

@interface BRMediaPlayer : NSObject <BRTransportDataProvider>
{
    NSMutableArray *_stateStack;
    id <BRPlayerDelegate> _playerDelegate;
}

+ (BOOL)allowMultiplePlayers;
+ (id)contentTypes;
+ (BOOL)handlesVideoForType:(id)arg1;
- (void)_checkPlayerMedia:(id)arg1;
- (void)_invalidateAsset:(id)arg1;
- (void)appendMediaList:(id)arg1;
- (void)appendMediaToSlidingWindow:(id)arg1;
- (BOOL)attemptAuthorizationWithError:(id *)arg1;
- (id)audioOptions;
- (struct BRTimeRange)bufferedRange;
- (float)bufferingProgress;
- (id)chapterAtIndex:(long)arg1;
- (long)chapterCount;
- (id)chapterGroupAtIndex:(long)arg1;
- (long)chapterGroupCount;
- (long)chapterGroupIndex;
- (long)chapterIndexForTime:(double)arg1;
- (BOOL)chapterIsPlayable:(long)arg1;
- (id)chapters;
- (void)clearStack;
- (id)collection;
- (BOOL)cueMediaWithError:(id *)arg1;
- (long)currentChapterIndex;
- (long)currentInterstitialIndex;
- (id)currentVideoFrame;
- (void)dealloc;
- (id)debugStringForState:(int)arg1;
- (BOOL)disablePlatformFilters;
- (double)duration;
- (double)elapsedTime;
- (void)handleFailedURLResponse:(id)arg1 requester:(id)arg2;
- (BOOL)hasRealChapters;
- (id)init;
- (id)interstitialTimes;
- (BOOL)isAssetReadyToPlay:(id)arg1;
- (BOOL)isPlaylistDynamic;
- (BOOL)isTrackEnabled:(int)arg1;
- (double)keyframeTimeNearTime:(double)arg1 searchForwards:(BOOL)arg2;
- (id)media;
- (int)mediaCount;
- (long)mediaIndex;
- (BOOL)muted;
- (void)nextChapter;
- (void)nextMedia;
- (int)peekState;
- (id)playbackDate;
- (id)playbackInfo;
@property(retain, nonatomic) id <BRPlayerDelegate> playerDelegate; // @synthesize playerDelegate=_playerDelegate;
- (id)playerSpecificOptions;
- (int)playerState;
- (BOOL)playingVisualContent;
- (int)playlistEndAction;
- (int)popState;
- (void)previousChapter;
- (void)previousMedia;
- (void)pushState:(int)arg1;
- (id)qualityOfServiceInfo;
- (int)repeatMode;
- (void)resetToBeginning;
- (BOOL)reverseTouchSwipeBehavior;
- (id)selectedAudioOption;
- (id)selectedMedia;
- (id)selectedSubtitleOption;
- (void)setChapterGroupIndex:(long)arg1;
- (void)setCurrentChapterIndex:(long)arg1;
- (void)setDisablePlatformFilters:(BOOL)arg1;
- (void)setElapsedTime:(double)arg1;
- (void)setFailedURLDelegate:(id)arg1;
- (void)setForcedSubtitleOption;
- (void)setForwardPlaybackEndTime:(double)arg1;
- (void)setIsPlaylistDynamic:(BOOL)arg1;
- (void)setMediaAsCurrentlyPlayingAppendingTrackList:(id)arg1;
- (BOOL)setMediaAtIndex:(long)arg1 inCollection:(id)arg2 error:(id *)arg3;
- (BOOL)setMediaAtIndex:(long)arg1 inTrackList:(id)arg2 error:(id *)arg3;
- (void)setMuted:(BOOL)arg1;
- (void)setPlaybackDate:(id)arg1;
- (void)setPlayerSpecificOptions:(id)arg1;
- (void)setPlaylistEndAction:(int)arg1;
- (void)setRepeatMode:(int)arg1;
- (void)setReversePlaybackEndTime:(double)arg1;
- (void)setSelectedAudioOption:(id)arg1;
- (void)setSelectedMedia:(id)arg1;
- (void)setSelectedSubtitleOption:(id)arg1;
- (void)setShufflePlayback:(BOOL)arg1;
- (void)setSkipExplicit:(BOOL)arg1;
- (void)setStartDate:(id)arg1 isEstimate:(BOOL)arg2;
- (void)setStartTime:(double)arg1;
- (BOOL)setState:(int)arg1 error:(id *)arg2;
- (void)setStopTime:(double)arg1;
- (void)setTrackEnabled:(BOOL)arg1 forTrackID:(int)arg2;
- (void)setVirtualChapterMark:(double)arg1;
- (void)setVolume:(float)arg1;
- (BOOL)shufflePlayback;
- (BOOL)skipExplicit;
- (id)startDate;
- (double)startTime;
- (double)stopTime;
- (BOOL)stopsActiveAudioPlayer;
- (id)subtitleOptions;
- (BOOL)supportsBufferedRange;
- (BOOL)supportsMultipleTrickSpeeds;
- (BOOL)supportsRepeatModes;
- (BOOL)supportsShufflePlayback;
- (BOOL)supportsTrickPlay;
- (BOOL)supportsVolumeControl;
- (int)swapState:(int)arg1;
- (id)trackList;
- (double)virtualChapterMark;
- (id)visuals;
- (float)volume;

@end

