//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRController.h>

@class BRHeaderControl, BRPairingPinControl, BRTextControl, NSString;

@interface BRPairingController : BRController
{
    BRHeaderControl *_header;
    BRPairingPinControl *_pinControl;
    BRTextControl *_requirementText;
    NSString *_startNotificationName;
    NSString *_stopNotificationName;
    BOOL _pairingHappenedWhileBuried;
}

+ (id)iTunesPairingControllerForChangingSyncHost;
+ (id)iTunesPairingControllerForInitialSync;
+ (id)iTunesPairingControllerForStreaming;
+ (id)iTunesPairingControllerForSync;
- (struct CGRect)_centeredMenuHeaderFrameForMasterFrame:(struct CGRect)arg1;
- (id)_generatePairingPINWithNumDigits:(int)arg1;
- (id)_initWithType:(int)arg1;
- (void)_setCancelText:(id)arg1;
- (void)_setPrimaryInfoText:(id)arg1;
- (void)_setRequirementsText:(id)arg1;
- (void)_setStartNotificationName:(id)arg1;
- (void)_setStopNotificationName:(id)arg1;
- (void)_setTitle:(id)arg1;
- (void)_syncStatusChangedNotification:(id)arg1;
- (id)accessibilityLabel;
- (BOOL)brEventAction:(id)arg1;
- (void)dealloc;
- (void)layoutSubcontrols;
- (void)wasExhumed;
- (void)wasPopped;
- (void)wasPushed;

@end

