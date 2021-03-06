//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

#import "BRTextField-Protocol.h"

@class BRDeviceKeyboardMessage, BRPasscodeSelectionLayer;

@interface BRPasscodeEntryControl : BRControl <BRTextField>
{
    BRPasscodeSelectionLayer *_passcodeLayer;
    unsigned int _numDigits;
    BOOL _isUserEditable;
    struct CGSize _passcodeLayerSize;
    BRDeviceKeyboardMessage *_deviceKeyboardMessage;
    id <BRTextFieldDelegate> _textFieldDelegate;
}

- (void)_handlePlayPauseButton:(id)arg1;
- (void)_layoutUI;
- (void)_shakeAnimationCompleted:(id)arg1;
- (id)accessibilityLabel;
- (id)accessibilityTraits;
- (BOOL)brEventAction:(id)arg1;
- (void)controlWasFocused;
- (void)controlWasUnfocused;
- (void)dealloc;
- (void)deviceKeyboardClose;
- (void)deviceKeyboardMessageHandler:(id)arg1;
- (void)deviceKeyboardUpdate:(BOOL)arg1;
- (id)initWithNumDigits:(unsigned int)arg1 userEditable:(BOOL)arg2 hideDigits:(BOOL)arg3;
- (BOOL)isAccessibilityElement;
- (struct CGSize)preferredSizeFromScreenSize:(struct CGSize)arg1;
- (void)reset;
- (void)setDelegate:(id)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)setInitialPasscode:(id)arg1;
- (void)setKeyboardTitle:(id)arg1;
- (void)setString:(id)arg1;
- (void)shake;
- (id)stringValue;
- (float)widthOfDigitsFromScreenSize:(struct CGSize)arg1;

@end

