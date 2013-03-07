//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImage, BRImageControl, BRTextControl, NSArray;

@interface BRButtonControl : BRControl
{
    int _style;
    BRImageControl *_imageControl;
    BRImageControl *_badgeControl;
    BRTextControl *_titleControl;
    BRTextControl *_subtitleControl;
    BRImageControl *_overlayImageControl;
    BRImageControl *_backgroundImageControl;
    BRImageControl *_bottomBackgroundImageControl;
    BRImage *_image;
    BRImage *_highlightedImage;
    NSArray *_subcontrolOrder;
    BOOL _subcontrolsNeedSorting;
    BOOL _buttonEnabled;
}

+ (id)actionButtonWithImage:(id)arg1 subtitle:(id)arg2 badge:(id)arg3;
+ (id)actionButtonWithTitle:(id)arg1 subtitle:(id)arg2 badge:(id)arg3;
+ (id)dashedActionButtonWithTitle:(id)arg1 subtitle:(id)arg2 selectable:(BOOL)arg3;
+ (id)dialogButtonWithTitle:(id)arg1;
+ (id)glossyButtonWithTitle:(id)arg1;
- (id)_addFadeAnimationToLayer:(id)arg1 forKey:(id)arg2;
- (void)_addOpacityFadeAnimationIfNeededToControl:(id)arg1;
- (void)_addSortedControl:(id)arg1;
- (void)_focusWasChanged;
- (void)_layoutActionSublayers;
- (void)_layoutDashedSublayers;
- (void)_layoutDialogSublayers;
- (void)_layoutGlossySublayers;
- (id)_nonFocusedOpacityForControlNamed:(id)arg1;
- (void)_setBackgroundHighlightImage:(id)arg1;
- (void)_setBottomBackgroundHighlightImage:(id)arg1;
- (void)_setControlOrderArray:(id)arg1;
- (void)_setNonAttributedSubtitle:(id)arg1;
- (void)_setNonAttributedTitle:(id)arg1;
- (void)_updateAllFocusOpacities;
- (void)_updateBackgroundDialogImages;
- (void)_updateFocusOpacityOfControl:(id)arg1;
- (void)_updateImageLayer;
- (id)accessibilityLabel;
- (id)accessibilityTraits;
- (id)badgeImage;
- (void)controlWasActivated;
- (void)controlWasFocused;
- (void)controlWasUnfocused;
- (void)dealloc;
- (id)highlightedImage;
- (id)image;
- (id)init;
- (BOOL)isAccessibilityElement;
- (void)layoutSubcontrols;
- (id)overayImage;
- (void)setBadgeImage:(id)arg1;
- (void)setButtonEnabled:(BOOL)arg1;
- (void)setButtonStyle:(int)arg1;
- (void)setHighlightedImage:(id)arg1;
- (void)setImage:(id)arg1;
- (void)setNonAttributedSubtitle:(id)arg1;
- (void)setNonAttributedTitle:(id)arg1;
- (void)setOverlayImage:(id)arg1;
- (void)setSubtitle:(id)arg1;
- (void)setTitle:(id)arg1;
- (id)subtitle;
- (id)title;

@end

