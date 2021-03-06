//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRAudioVisualizerControl.h"

@class BRMediaPlayer, BRMusicNowPlayingLayer, NSString, NSTimer;

__attribute__((visibility("hidden")))
@interface BRMusicNowPlayingControl : BRAudioVisualizerControl
{
    BRMusicNowPlayingLayer *_layer;
    BRMediaPlayer *_player;
    NSString *_lastAssetID;
    NSTimer *_flipTimer;
    NSTimer *_delayedContentUpdateTimer;
    NSTimer *_assetChangeAnimationUnblockTimer;
    NSTimer *_spinnerTimer;
    double _lastEventTime;
    double _flipDuration;
    double _flipInterval;
    double _assetChangeAnimationBlockTime;
    double _assetChangeAnimationDuration;
    double _newTrackKicksInTime;
    double _oldTrackFadeOutTime;
    double _postFlipAssetChangeAnimationBlockTime;
    int _transitionDirection;
    BOOL _assetChangeAnimationBlockFlag;
    BOOL _buffering;
}

- (void)_chapterPictureChanged:(id)arg1;
- (id)_fetchCoverArt;
- (void)_flipNow:(id)arg1;
- (void)_mediaCued:(id)arg1;
- (void)_periodicMetadataChanged:(id)arg1;
- (void)_playbackAssetChanged:(id)arg1;
- (void)_playbackProgressChanged:(id)arg1;
- (void)_playerStateChanged:(id)arg1;
- (void)_playlistChanged:(id)arg1;
- (void)_radioBufferingEnd:(id)arg1;
- (void)_radioBufferingStart:(id)arg1;
- (void)_repeatModeChanged:(id)arg1;
- (void)_scheduleFlipTimerWithDelay:(double)arg1;
- (void)_setTransitionDirection:(id)arg1;
- (void)_shuffleModeChanged:(id)arg1;
- (void)_spinnerTimerFired:(id)arg1;
- (void)_unblockAssetChangeAnimation:(id)arg1;
- (void)_updateCoverArt:(id)arg1;
- (void)_updateElapsedTime;
- (void)_updatePlayerRepeatState;
- (void)_updatePlayerShuffleState;
- (void)_updateSpinner;
- (void)_updateTrackWithTransition:(BOOL)arg1;
- (id)accessibilityScreenContent;
- (BOOL)brEventAction:(id)arg1;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)dealloc;
- (BOOL)displayTrackPopup;
- (id)init;
- (BOOL)isAccessibilityElement;
- (void)layoutSubcontrols;
- (id)player;
- (void)setPlayer:(id)arg1;

@end

