//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRKeyboard.h>

@class BRControl;

__attribute__((visibility("hidden")))
@interface BRKeyboardRomanLogIn : BRKeyboard
{
    BRControl *_sixthRow;
}

- (float)_actionKeysContainerSpacing;
- (float)_actionKeysContainerWidth;
- (id)_keyboardDataFileName;
- (float)_mainKeysHorizontalSpacing;
- (float)_mainKeysVerticalSpacing;
- (int)_numberOfMainKeyColumns;
- (int)_numberOfMainKeyRows;
- (id)_popupKeyboardDataFileName;
- (float)_preferredTextEntryControlWidth;
- (float)_verticalGapBetweenMainAndActionKeys;
- (id)accessibilityLabel;
- (void)dealloc;
- (id)init;
- (struct CGRect)keyboardControlFrame;
- (float)layoutGapBelowKeyboardControl;
- (float)layoutGapBelowTabControl;
- (id)name;
- (int)numberOfKeyboardsForCurrentKeyboardType;
- (id)switchToThisKeyboardIdentifier;
- (struct CGRect)tabControlFrame;

@end

