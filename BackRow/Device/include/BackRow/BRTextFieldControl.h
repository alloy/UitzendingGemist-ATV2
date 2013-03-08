//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

#import "BRTextField-Protocol.h"

@class BRMarqueeTextControl, NSDictionary, NSMutableString, NSTimer;

@interface BRTextFieldControl : BRControl <BRTextField>
{
    id _delegate;
    id _characterDelegate;
    BRMarqueeTextControl *_displayString;
    NSMutableString *_clearString;
    NSDictionary *_savedAttributes;
    BOOL _useSecureText;
    BOOL _processingDeleteChar;
    BOOL _showCursor;
    BOOL _cursorVisible;
    int _textLengthLimit;
    NSTimer *_textObscureTimer;
    NSTimer *_cursorBlinkTimer;
}

- (void)_blinkCursorTimerFired:(id)arg1;
- (id)_secureTextFromClearText;
- (void)_secureTextObscureTimerFired:(id)arg1;
- (void)_startSecureTextObscureTimer;
- (void)_stopBlinkCursorTimer;
- (void)_stopSecureTextObscureTimer;
- (id)accessibilityTraits;
- (id)accessibilityValue;
- (BOOL)brKeyEvent:(id)arg1;
- (id)characterDelegate;
- (void)controlWasDeactivated;
- (void)dealloc;
- (id)delegate;
- (id)init;
- (float)maxScrollPosition;
- (BOOL)needsScrollingInBounds:(struct CGRect)arg1;
- (void)setCharacterDelegate:(id)arg1;
- (void)setClearString:(id)arg1;
- (void)setDelegate:(id)arg1;
- (void)setDisplayString:(id)arg1;
- (void)setScrollPosition:(float)arg1;
- (void)setShowCursor:(BOOL)arg1;
- (void)setString:(id)arg1;
- (void)setTextAttributes:(id)arg1;
- (void)setTextLengthLimit:(int)arg1;
- (void)setUseSecureText:(BOOL)arg1;
- (BOOL)showCursor;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (id)stringValue;
- (id)textAttributes;
- (int)textLengthLimit;
- (BOOL)useSecureText;

@end

