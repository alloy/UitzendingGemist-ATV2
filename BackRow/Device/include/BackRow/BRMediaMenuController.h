//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRMenuController.h"

@class BRControl, BRFocusableImageControl, BRTextControl, BRWaitSpinnerControl, NSString, NSTimer;

@interface BRMediaMenuController : BRMenuController
{
    BRControl *_previewControl;
    BRControl *_previewContainer;
    NSString *_previewControlItemHash;
    BRFocusableImageControl *_actionControl;
    BRWaitSpinnerControl *_spinner;
    float _controlDelay;
    NSTimer *_controlDelayTimer;
    BRTextControl *_noContentMessageControl;
}

- (void)_cleanupControlDelayTimer;
- (void)_controlDelayTimerHandler:(id)arg1;
- (void)_playstateChanged;
- (void)_scrollSelectionFinalized:(id)arg1;
- (void)_scrollWillStart:(id)arg1;
- (void)_setDislaysActionControl:(BOOL)arg1;
- (void)_updateActionControl;
- (void)_updateControls;
- (void)_updateControlsWithDelay;
- (void)_updatePreview;
- (id)accessibilityScreenContent;
- (id)actionItemAtIndex:(long)arg1;
- (id)actionSelectionHandlerForItemAtIndex:(long)arg1;
- (BOOL)allowUnplayedMark;
- (BOOL)brEventAction:(id)arg1;
- (void)clearPreviewController;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)dealloc;
- (id)focusedControlForEvent:(id)arg1 focusPoint:(struct CGPoint *)arg2;
- (id)init;
- (void)layoutSubcontrols;
- (id)noContentMessage;
- (id)previewControlForItem:(long)arg1;
- (void)refreshControllerForModelUpdate;
- (void)refreshControllerForModelUpdateToObject:(id)arg1;
- (void)resetPreviewController;
- (void)setNoContentMessage:(id)arg1;
- (void)setShowSpinner:(BOOL)arg1;
- (BOOL)showSpinner;
- (void)updatePreviewController;

@end

