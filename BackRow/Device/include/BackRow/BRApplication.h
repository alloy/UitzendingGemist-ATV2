//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class BREvent, NSMapTable, NSMutableArray, NSTimer;
@protocol BRApplicationDelegate;

@interface BRApplication : NSObject
{
    BREvent *_currentEvent;
    NSTimer *_retriggerTimer;
    NSTimer *_b39PlayPauseHoldTimer;
    NSMutableArray *_eventQueue;
    void *_autoreleasePoolMark;
    struct __CFRunLoopSource *_source;
    struct __CFRunLoop *_mainRunLoop;
    double _flushBeforeTimeStamp;
    long _retriggerCount;
    double _nextRetriggerDelay;
    BOOL _handlingEvent;
    BOOL _isInModalLoop;
    BOOL _eventsBlocked;
    BOOL _isTerminating;
    BOOL _b39PlayPauseHoldTimerFired;
    NSMapTable *_endOfEventSelectorsByObserver;
    id <BRApplicationDelegate> _delegate;
    id <BRResponder> _firstResponder;
}

+ (id)sharedApplication;
- (BOOL)_b39PlayPauseHoldTimerFired;
- (void)_blockEvents;
- (void)_drainRunLoopPool;
@property(readonly) NSMapTable *_endOfEventSelectorsByObserver; // @dynamic _endOfEventSelectorsByObserver;
- (void)_handleB39PlayPauseTimerFire:(id)arg1;
- (void)_handler;
- (void)_registerForEvents;
- (void)_retriggerEvent:(id)arg1;
- (void)_run;
- (void)_setB39PlayPauseHoldTimer:(id)arg1;
- (void)_unblockEvents;
- (void)cancelRetriggerCurrentEvent;
- (id)currentEvent;
- (void)dealloc;
@property(retain) id <BRApplicationDelegate> delegate; // @synthesize delegate=_delegate;
- (void)dispatchEventOnEventThread:(id)arg1;
- (void)emptyQueue;
@property id <BRResponder> firstResponder; // @synthesize firstResponder=_firstResponder;
- (id)init;
- (BOOL)isInModalLoop;
- (BOOL)isTerminating;
- (double)nextRetriggerDelay;
- (void)postEvent:(id)arg1;
- (long)retriggerCount;
- (void)retriggerCurrentEvent;
- (void)retriggerCurrentEventAfterDelay:(double)arg1;
- (void)retriggerCurrentEventWithDecreasingDelay;
- (void)setIsInModalLoop:(BOOL)arg1;
- (void)terminate;

@end

