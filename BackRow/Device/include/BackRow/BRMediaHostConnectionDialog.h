//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRTextWithSpinnerController.h"

@class BRController, BRMediaHost;

__attribute__((visibility("hidden")))
@interface BRMediaHostConnectionDialog : BRTextWithSpinnerController
{
    BRMediaHost *_mediaHost;
    id <BRMediaProvider><BRMediaLoading> _providerNeedingAuth;
    BRController *_controllerUnderneath;
    BOOL _timerSatisfied;
    BOOL _wasBuried;
    BOOL _passwordWasEntered;
    BOOL _authAlreadyAttempted;
}

- (void)_authRequired:(id)arg1;
- (void)_checkMountStatus:(id)arg1;
- (void)_hostsChanged:(id)arg1;
- (void)_waitForHostReset:(id)arg1;
- (BOOL)brEventAction:(id)arg1;
- (void)dealloc;
- (id)initWithHost:(id)arg1;
- (id)mediaHost;
- (void)setMediaHost:(id)arg1;
- (void)textDidChange:(id)arg1;
- (void)textDidEndEditing:(id)arg1;
- (void)wasBuried;
- (void)wasPushed;

@end

