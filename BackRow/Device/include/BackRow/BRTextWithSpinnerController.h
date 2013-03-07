//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRController.h>

@class BRWaitPromptControl, NSTimer;

@interface BRTextWithSpinnerController : BRController
{
    NSTimer *_revealTimer;
    double _revealInterval;
    BRWaitPromptControl *_prompt;
    BOOL _isNetworkDependent;
}

- (void)_checkActivationState:(id)arg1;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)dealloc;
- (id)initWithTitle:(id)arg1 text:(id)arg2;
- (id)initWithTitle:(id)arg1 text:(id)arg2 isNetworkDependent:(BOOL)arg3;
- (id)initWithTitle:(id)arg1 text:(id)arg2 isNetworkDependent:(BOOL)arg3 revealAfter:(double)arg4;
- (id)initWithTitle:(id)arg1 text:(id)arg2 revealAfter:(double)arg3;
- (BOOL)isNetworkDependent;
- (void)setIcon:(id)arg1 horizontalOffset:(float)arg2 kerningFactor:(float)arg3;

@end

