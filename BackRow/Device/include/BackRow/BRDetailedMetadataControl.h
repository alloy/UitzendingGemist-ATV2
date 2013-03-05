/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRMetadataContainer.h"
#import "AppleTV-Structs.h"
#import "BRControl.h"

@class BRTextControl, BRDividerControl, NSMutableArray, BRMetadataTitleControl;

@interface BRDetailedMetadataControl : BRControl <BRMetadataContainer> {
@private
	int _displayOption;	// 48 = 0x30
	BRMetadataTitleControl *_titleControl;	// 52 = 0x34
	BRDividerControl *_topDivider;	// 56 = 0x38
	BRDividerControl *_middleDivider;	// 60 = 0x3c
	BRTextControl *_summaryControl;	// 64 = 0x40
	NSMutableArray *_detailControls;	// 68 = 0x44
	int _currentDetailIndex;	// 72 = 0x48
}
@property(assign, nonatomic) int currentDetailIndex;	// G=0x3668bc3d; S=0x3668bc4d; @synthesize=_currentDetailIndex
@property(retain, nonatomic) NSMutableArray *detailControls;	// G=0x3668bc09; S=0x3668bc19; @synthesize=_detailControls
@property(readonly, assign, nonatomic) BRMetadataTitleControl *titleControl;	// G=0x3668bbf9; @synthesize=_titleControl
- (id)init;	// 0x3668ab15
- (id)_currentDetailControl;	// 0x3668bb91
- (id)_detailControlAtIndex:(int)index;	// 0x3668bbb1
- (id)accessibilityLabel;	// 0x3668bb21
- (void)addDetailPage:(id)page;	// 0x3668b415
- (void)addDetailStrings:(id)strings withLabel:(id)label;	// 0x3668b175
// declared property getter: - (int)currentDetailIndex;	// 0x3668bc3d
- (void)dealloc;	// 0x3668aced
// declared property getter: - (id)detailControls;	// 0x3668bc09
- (void)layoutSubcontrols;	// 0x3668b479
- (float)renderedHeightForWidth:(float)width;	// 0x3668b911
// declared property setter: - (void)setCurrentDetailIndex:(int)index;	// 0x3668bc4d
// declared property setter: - (void)setDetailControls:(id)controls;	// 0x3668bc19
- (void)setMetadata:(id)metadata withLabels:(id)labels;	// 0x3668b3cd
- (void)setRating:(id)rating;	// 0x3668adc9
- (void)setSummary:(id)summary;	// 0x3668ade9
- (void)setTitle:(id)title;	// 0x3668ad89
- (void)setTitleSubtext:(id)subtext;	// 0x3668ada9
- (void)setTopRightImage:(id)image;	// 0x3668afc1
// declared property getter: - (id)titleControl;	// 0x3668bbf9
- (void)toggleSummaryMetadataView;	// 0x3668afe1
@end

