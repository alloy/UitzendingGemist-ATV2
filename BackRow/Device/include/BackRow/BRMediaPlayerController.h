//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRController.h>

#import "BRSecureResource.h"
#import "BRVideoCacheManagerDelegate.h"

@class BRControl, BRDescriptionOverlayControl, BRMediaPlayer, BRMediaPlayerEventHandler, BRResumeMenuControl, BRTextControl, BRTransportControl, NSTimer;

__attribute__((visibility("hidden")))
@interface BRMediaPlayerController : BRController <BRVideoCacheManagerDelegate, BRSecureResource>
{
    long _state;
    BRControl *_content;
    BRControl *_audioVisualizer;
    BRMediaPlayer *_player;
    BRMediaPlayerEventHandler *_eventHandler;
    BRResumeMenuControl *_resumeMenu;
    BRTransportControl *_transport;
    BRControl *_javascriptOverlay;
    BRDescriptionOverlayControl *_descriptionOverlay;
    BRTextControl *_explanatoryTextControl;
    id _delegate;
    id _transitionAnimationDelegate;
    NSTimer *_suppressBackgroundProcessTimer;
    NSTimer *_explanatoryTextFadeTimer;
    NSTimer *_readyToPlayTimer;
    NSTimer *_readyToPlayUpdateMinsTimer;
    NSTimer *_readyToPlayBandwidthHintTimer;
    NSTimer *_loadingSpinnerDelayTimer;
    float _lastBufferingProgress;
    unsigned int _startChapterIndex;
    float _startPosition;
    double _bandwidthHintReadyToPlayMaxTimeInSeconds;
    BOOL _drmAttempted;
    BOOL _authenticationAttempted;
    BOOL _playbackInitiated;
    BOOL _shouldRestoreVoiceOver;
    BOOL _alwaysStopOnPop;
    BOOL _transportDisabled;
    BOOL _resumeMenuDisabled;
    BOOL _waitingForTransition;
    BOOL _visualsHidden;
    BOOL _inChapterMode;
    BOOL _digitalExtrasMenuItemDisabled;
    BOOL _itemReadyToPlay;
    BOOL _supportsBandwidthHints;
    BOOL _supportsPreviewBandwidthHints;
}

+ (id)controllerForPlayer:(id)arg1;
- (id)_audioVisualizer;
- (void)_authenticationCancelled:(id)arg1;
- (void)_authenticationFailed:(id)arg1;
- (void)_authenticationSucceeded:(id)arg1;
- (void)_authorizationAttemptComplete:(id)arg1;
- (BOOL)_cycleInfoDisplay:(id)arg1;
- (id)_descriptionOverlayForType:(id)arg1;
- (void)_dismissResumeMenu;
- (BOOL)_enterAudioSubtitleChapterPicker;
- (void)_enterAuthenticationState;
- (void)_enterChaptersSubtitlesAndAlternateAudioPickingState;
- (void)_enterDRMSyncState;
- (void)_enterDownloadWaitStateWithTime:(double)arg1;
- (void)_enterErrorStateWithError:(id)arg1;
- (void)_enterMediaCueingState;
- (void)_enterMediaResolutionState;
- (void)_enterPINEntryState;
- (void)_enterPlaybackStatePlaying:(BOOL)arg1;
- (void)_enterPostResumeMenuStateAtTime:(double)arg1;
- (void)_enterResumeMenuState;
- (void)_exitChaptersSubtitlesAndAlternateAudioPickingState;
- (void)_explanatoryTextTimerFired:(id)arg1;
- (BOOL)_handleContextMenuEvent:(id)arg1;
- (void)_handleContextMenuSelection:(id)arg1;
- (BOOL)_handleDownEvent:(id)arg1;
- (BOOL)_handleDownloadStateEvent:(id)arg1;
- (void)_handleHideChapterMarkers;
- (BOOL)_handleMenuButtonEvent:(id)arg1;
- (void)_handleShowChapterMarkers;
- (BOOL)_handleUpDownCommandsForInfoDisplay:(id)arg1;
- (BOOL)_handleUpEvent:(id)arg1;
- (void)_initiatePlayback;
- (id)_javascriptOverlay;
- (id)_photoSet;
- (void)_playerAssetChanged:(id)arg1;
- (void)_playerError:(id)arg1;
- (void)_playerIsReadyToPlay:(id)arg1;
- (void)_playerMediaCued:(id)arg1;
- (void)_playerPlaybackEnded:(id)arg1;
- (void)_playerStateChanged:(id)arg1;
- (void)_playerTimeSkipped:(id)arg1;
- (void)_playerVisualsChanged:(id)arg1;
- (void)_readyToPlayBandwidthHintTimerFired:(id)arg1;
- (void)_readyToPlayTimerFired:(id)arg1;
- (void)_readyToPlayUpdateMinsTimerFired:(id)arg1;
- (BOOL)_requiresLeaseForAsset:(id)arg1;
- (void)_restoreVoiceOverIfNeeded;
- (void)_resumeItemSelected:(id)arg1;
- (double)_resumeTime;
- (BOOL)_shouldShowResumeMenu;
- (BOOL)_shouldUseMusicContextMenu;
- (void)_showLoadingSpinner;
- (void)_showTransport:(id)arg1;
- (void)_spinnerDelayTimerFired:(id)arg1;
- (void)_startFromBeginningItemSelected:(id)arg1;
- (void)_suppressBackgroundProcesses:(id)arg1;
- (void)_transitionAnimationFinished;
- (id)_transportControlForType:(id)arg1;
- (void)_updateExplantoryText;
- (void)_updatePlaybackControls;
- (void)_updateReadyToPlayTime:(struct __ATVMediaItem *)arg1;
- (void)_updateVoiceOverDisabling;
- (BOOL)accessibilityOutputsRangeForChildren;
- (BOOL)alwaysStopPlaybackWhenPopped;
- (BOOL)brEventAction:(id)arg1;
- (BOOL)canBeScreenSaver;
- (void)clearPlayer;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)dealloc;
- (BOOL)digitalExtrasMenuItemDisabled;
- (BOOL)handleAssetFailedToLoad:(id)arg1;
- (BOOL)handleAssetReadyToPlay:(id)arg1;
- (id)initWithPlayer:(id)arg1;
- (id)javascriptOverlay;
- (void)layoutSubcontrols;
- (id)player;
- (id)playerDelegate;
- (id)providersForContextMenu;
- (int)repeatMode;
- (void)requiredScope:(unsigned int *)arg1 accountType:(id *)arg2;
- (BOOL)resumeMenuDisabled;
- (void)setAlwaysStopPlaybackWhenPopped:(BOOL)arg1;
- (void)setDigitalExtrasMenuItemDisabled:(BOOL)arg1;
- (void)setFailedURLDelegate:(id)arg1;
- (void)setForwardPlaybackEndTime:(double)arg1;
- (void)setPlayerDelegate:(id)arg1;
- (void)setRepeatMode:(int)arg1;
- (void)setResumeMenuDisabled:(BOOL)arg1;
- (void)setReversePlaybackEndTime:(double)arg1;
- (void)setStartChapterIndex:(unsigned int)arg1;
- (void)setStartDate:(id)arg1 isEstimate:(BOOL)arg2;
- (void)setStartPosition:(float)arg1;
- (void)setTransportControlDisabled:(BOOL)arg1;
- (void)setVisualsHidden:(BOOL)arg1;
- (BOOL)shouldShowTrackPopup;
- (BOOL)shouldTransitionIn;
- (unsigned int)startChapterIndex;
- (id)startDate;
- (float)startPosition;
- (BOOL)transportControlDisabled;
- (BOOL)visualsHidden;
- (void)wasPopped;

@end

