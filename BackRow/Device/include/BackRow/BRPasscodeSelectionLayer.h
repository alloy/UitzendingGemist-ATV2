//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImageControl, BRPasscodeSelectionWidget, BRTextControl, NSArray;

__attribute__((visibility("hidden")))
@interface BRPasscodeSelectionLayer : BRControl
{
    NSArray *_backgroundLayers;
    NSArray *_digitLayers;
    NSArray *_bulletLayers;
    BRImageControl *_arrowsLayer;
    BRPasscodeSelectionWidget *_selectionWidget;
    BRTextControl *_doneLayer;
    BOOL _isUserEditable;
    unsigned int _numDigits;
    BOOL _hideDigits;
    int _selection;
}

- (void)_adjustDigitVisibility:(id)arg1;
- (struct CGRect)_arrowsFrameForSelection:(int)arg1;
- (id)_buildArrowsLayer;
- (id)_buildBackgroundLayers;
- (id)_buildBulletLayers;
- (id)_buildDigitLayers;
- (id)_buildDoneLayer;
- (struct CGRect)_cellFrameForSelection:(int)arg1;
- (struct CGRect)_digitFrameForSelection:(int)arg1 digit:(id)arg2;
- (void)_hideDigitAtIndex:(int)arg1;
- (float)_layoutUIWithHeight:(float)arg1;
- (struct CGRect)_selectionWidgetFrameForSelection:(int)arg1;
- (void)_setDigitHighlighted:(BOOL)arg1 atIndex:(int)arg2;
- (void)_setDigitValue:(id)arg1 atIndex:(int)arg2;
- (void)_setSelection:(int)arg1;
- (id)accessibilityLabel;
- (id)accessibilityTraits;
- (void)dealloc;
- (BOOL)decrementSelection;
- (BOOL)digitsHidden;
- (BOOL)doneButtonSelected;
- (void)hideDigits:(int)arg1;
- (BOOL)incrementSelection;
- (id)initWithNumDigits:(unsigned int)arg1 userEditable:(BOOL)arg2 hideDigits:(BOOL)arg3;
- (BOOL)moveSelectionLeft;
- (BOOL)moveSelectionRight;
- (id)passcode;
- (struct CGRect)preferredFrameForScreenSize:(struct CGSize)arg1;
- (void)reset;
- (void)setFrame:(struct CGRect)arg1;
- (void)setPasscode:(id)arg1;
- (BOOL)setSelection:(int)arg1;
- (void)showDigits;
- (float)widthOfDigitsForScreenSize:(struct CGSize)arg1;

@end

