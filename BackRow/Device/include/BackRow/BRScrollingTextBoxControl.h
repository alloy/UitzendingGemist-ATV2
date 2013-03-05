/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import "BRControl.h"

@class BRListControl, NSAttributedString, BRVerticalScrollBarControl;

@interface BRScrollingTextBoxControl : BRControl {
@private
	BRListControl *_list;	// 48 = 0x30
	NSAttributedString *_text;	// 52 = 0x34
	BRVerticalScrollBarControl *_scrollBar;	// 56 = 0x38
	float _textHeightFactor;	// 60 = 0x3c
	long _upperFocusLimit;	// 64 = 0x40
	long _lowerFocusLimit;	// 68 = 0x44
}
@property(retain) NSAttributedString *text;	// G=0x366bf4e9; S=0x366bf469; converted property
@property(assign) float textHeightFactor;	// G=0x366bf509; S=0x366bf4f9; converted property
- (id)init;	// 0x366bf151
- (void)_calculateFocusLimitsWithTextBoxSize:(CGSize)textBoxSize;	// 0x366bf951
- (void)_forceSelectionToFocusLimit;	// 0x366bf875
- (void)_listSelectionChanged:(id)changed;	// 0x366bf865
- (void)_providerCountChanged:(id)changed;	// 0x366bfb15
- (id)accessibilityLabel;	// 0x366bf83d
- (BOOL)brEventAction:(id)action;	// 0x366bf519
- (void)dealloc;	// 0x366bf3c5
- (void)layoutSubcontrols;	// 0x366bf5b5
// converted property setter: - (void)setText:(id)text;	// 0x366bf469
// converted property setter: - (void)setTextHeightFactor:(float)factor;	// 0x366bf4f9
// converted property getter: - (id)text;	// 0x366bf4e9
// converted property getter: - (float)textHeightFactor;	// 0x366bf509
@end

