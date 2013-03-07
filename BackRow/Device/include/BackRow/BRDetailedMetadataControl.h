//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

#import "BRMetadataContainer-Protocol.h"

@class BRDividerControl, BRMetadataTitleControl, BRTextControl, NSMutableArray;

@interface BRDetailedMetadataControl : BRControl <BRMetadataContainer>
{
    int _displayOption;
    BRMetadataTitleControl *_titleControl;
    BRDividerControl *_topDivider;
    BRDividerControl *_middleDivider;
    BRTextControl *_summaryControl;
    NSMutableArray *_detailControls;
    int _currentDetailIndex;
}

- (id)_currentDetailControl;
- (id)_detailControlAtIndex:(int)arg1;
- (id)accessibilityLabel;
- (void)addDetailPage:(id)arg1;
- (void)addDetailStrings:(id)arg1 withLabel:(id)arg2;
@property(nonatomic) int currentDetailIndex; // @synthesize currentDetailIndex=_currentDetailIndex;
- (void)dealloc;
@property(retain, nonatomic) NSMutableArray *detailControls; // @synthesize detailControls=_detailControls;
- (id)init;
- (void)layoutSubcontrols;
- (float)renderedHeightForWidth:(float)arg1;
- (void)setMetadata:(id)arg1 withLabels:(id)arg2;
- (void)setRating:(id)arg1;
- (void)setSummary:(id)arg1;
- (void)setTitle:(id)arg1;
- (void)setTitleSubtext:(id)arg1;
- (void)setTopRightImage:(id)arg1;
@property(readonly, nonatomic) BRMetadataTitleControl *titleControl; // @synthesize titleControl=_titleControl;
- (void)toggleSummaryMetadataView;

@end

