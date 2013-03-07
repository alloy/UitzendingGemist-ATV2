//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

#import "BRContainerViewCell.h"

@class BRDividerControl;

@interface BRBoxControl : BRControl <BRContainerViewCell>
{
    BRControl *_content;
    BRDividerControl *_divider;
    float _dividerMargin;
    CDStruct_1420b1e7 _dividerSuggestedHeight;
    CDStruct_1420b1e7 _space;
    CDUnknownBlockType _loadCompletionBlock;
    CDStruct_83d0eb64 _contentSize;
}

- (id)accessibilityLabel;
- (void)cancelContainerViewLoad;
- (id)content;
@property(nonatomic) CDStruct_83d0eb64 contentSize; // @synthesize contentSize=_contentSize;
- (void)controlWasDeactivated;
- (void)dealloc;
- (id)description;
- (id)divider;
- (float)dividerMargin;
- (CDStruct_1420b1e7)dividerSuggestedHeight;
- (void)layoutSubcontrols;
- (void)loadWithCompletionBlock:(CDUnknownBlockType)arg1;
- (void)setContent:(id)arg1;
- (void)setDivider:(id)arg1;
- (void)setDividerMargin:(float)arg1;
- (void)setDividerSuggestedHeight:(CDStruct_1420b1e7)arg1;
- (void)setIdentifier:(id)arg1;
- (void)setIgnoreLoadAndDisplayOnDemand;
- (void)setIgnoreLoadAndDisplayOnDemandDisableAnimations:(BOOL)arg1;
- (void)setReadyToDisplay;
- (void)setSpace:(CDStruct_1420b1e7)arg1;
- (void)windowMaxBoundsChanged;

@end

