//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

@class CADisplay, NSMutableArray, NSString, NSTimer;

@interface BRDisplayManager : BRSingleton
{
    CADisplay *_display;
    int _modeChangeFailureCount;
    NSTimer *_modeChangeFailureRetryTimer;
    BOOL _computingAllModes;
    BOOL _settingCurrentMode;
    NSMutableArray *_nonVirtualModes;
    NSMutableArray *_virtualModes;
    NSString *_displayIDMatchingModes;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (void)_availableModesDidChange;
- (void)_clearUserPreferredModeForCurrentDisplay;
- (void)_computeAllModesForDisplay;
- (BOOL)_currentModeIsValid;
- (void)_displayModeDidChange;
- (BOOL)_setCurrentMode:(id)arg1;
- (void)_setDisplay:(id)arg1;
- (void)_setDisplayToDefaultColorMode;
- (void)_setDisplayToDefaultMode;
- (id)_uniqueDisplayID;
- (id)_userPreferredModeForCurrentDisplay;
- (id)_windowServerDisplay;
- (id)allPotentialModes;
- (int)colorMode;
- (id)currentMode;
- (BOOL)currentModeIsAuto;
- (void)dealloc;
- (BOOL)displayModeSupported:(id)arg1;
- (id)init;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
- (BOOL)setColorMode:(int)arg1;
- (BOOL)setCurrentModeToAuto;
- (BOOL)setUserPreferredMode:(id)arg1;
- (id)stringForDisplayMode:(id)arg1;
- (id)uiStringForDisplayMode:(id)arg1;

@end

