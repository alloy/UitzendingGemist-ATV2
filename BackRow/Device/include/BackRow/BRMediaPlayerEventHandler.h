//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "BRResponder.h"

@class BRMediaPlayer, NSTimer;

__attribute__((visibility("hidden")))
@interface BRMediaPlayerEventHandler : NSObject <BRResponder>
{
    BRMediaPlayer *_player;
    BOOL _waitingForUp;
    BOOL _inChapterSkipMode;
    double _virtualChapterMark;
    NSTimer *_chapterSelectionModeTimer;
    int _preShuttleState;
    long _shuttleSpeed;
    int _shuttleDirection;
    BOOL _inShuttleMode;
    BOOL _readyToInitiateShuttle;
    NSTimer *_shuttleChapterSkipTimer;
    struct CGPoint _initialTouchPosition;
    struct CGPoint _lastTouchPosition;
    struct CGPoint _lastTouchDelta;
    double _shuttleFinishedTime;
}

+ (id)handlerWithPlayer:(id)arg1;
- (BOOL)_changePlayerStateTo:(int)arg1;
- (BOOL)_changePlayerStateTo:(int)arg1 onButtonDown:(id)arg2 retrigger:(BOOL)arg3;
- (BOOL)_chapterSkipSupported;
- (BOOL)_chapteringSupported;
- (BOOL)_defaultEventHandler:(id)arg1;
- (void)_endChapterSelectionMode:(id)arg1;
- (void)_handleAccessibilityOutputForState:(int)arg1;
- (BOOL)_handleEventWhileChapterSelecting:(id)arg1;
- (BOOL)_handleEventWhileFF1:(id)arg1;
- (BOOL)_handleEventWhileFF2:(id)arg1;
- (BOOL)_handleEventWhileFF3:(id)arg1;
- (BOOL)_handleEventWhileLoading:(id)arg1;
- (BOOL)_handleEventWhilePaused:(id)arg1;
- (BOOL)_handleEventWhilePlaying:(id)arg1;
- (BOOL)_handleEventWhileREW1:(id)arg1;
- (BOOL)_handleEventWhileREW2:(id)arg1;
- (BOOL)_handleEventWhileREW3:(id)arg1;
- (BOOL)_handleEventWhileSlowForward1:(id)arg1;
- (BOOL)_handleEventWhileSlowForward2:(id)arg1;
- (BOOL)_handleEventWhileSlowForward3:(id)arg1;
- (BOOL)_handleEventWhileSlowRewind1:(id)arg1;
- (BOOL)_handleEventWhileSlowRewind2:(id)arg1;
- (BOOL)_handleEventWhileSlowRewind3:(id)arg1;
- (BOOL)_handleForwardEvent:(id)arg1;
- (BOOL)_handleLeftEvent:(id)arg1;
- (BOOL)_handleLeftEventWhileChapterSkipping:(id)arg1;
- (BOOL)_handleRewindEvent:(id)arg1;
- (BOOL)_handleRightEvent:(id)arg1;
- (BOOL)_handleRightEventWhileChapterSkipping:(id)arg1;
- (BOOL)_handleTouchEvent:(id)arg1;
- (BOOL)_handleTouchMultiSwipeLeftEvent:(id)arg1;
- (BOOL)_handleTouchMultiSwipeRightEvent:(id)arg1;
- (BOOL)_handleTouchSwipeEvent:(id)arg1;
- (BOOL)_handleTouchSwipeLeftEvent:(id)arg1;
- (BOOL)_handleTouchSwipeRightEvent:(id)arg1;
- (BOOL)_handleTrickPlayWhileLoading:(id)arg1;
- (void)_initiateShuttleAction;
- (BOOL)_isFavoriteRadioStation;
- (BOOL)_performNextThingButtonAction:(id)arg1;
- (BOOL)_performPreviousThingButtonAction:(id)arg1;
- (void)_performShuttle:(long)arg1;
- (void)_performShuttleExit;
- (BOOL)_performSkipBackwardAction:(id)arg1;
- (BOOL)_performSkipForwardAction:(id)arg1;
- (BOOL)_performVolumeDownAction:(id)arg1;
- (BOOL)_performVolumeUpAction:(id)arg1;
- (void)_playSoundForState:(int)arg1;
- (void)_playerAssetChanged:(id)arg1;
- (void)_playerStateChanged:(id)arg1;
- (void)_setInChapterSkipMode:(BOOL)arg1;
- (void)_setShuttleSpeed:(int)arg1;
- (void)_touchRepeatCancel;
- (void)_touchRepeatEvent;
- (BOOL)brEventAction:(id)arg1;
- (BOOL)brKeyEvent:(id)arg1;
- (void)dealloc;
- (id)initWithPlayer:(id)arg1;
- (BOOL)showingChapterMarks;

@end

