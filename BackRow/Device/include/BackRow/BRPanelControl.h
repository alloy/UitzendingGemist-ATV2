//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@interface BRPanelControl : BRControl
{
    BRControl *_background;
    int _mode;
    float _nonAxisAlignment;
    float _verticalSpacing;
    float _verticalMargin;
    float _horizontalSpacing;
    float _horizontalMargin;
}

- (struct CGRect)_marginedFrameForFrame:(struct CGRect)arg1 screenRes:(struct CGSize)arg2;
- (void)_performFillRightToLeft:(id)arg1;
- (void)_performFillTopToBottom:(id)arg1;
- (struct CGSize)_performFlowRightToLeft:(id)arg1 inBounds:(struct CGSize)arg2 setFrame:(BOOL)arg3;
- (struct CGSize)_performFlowTopToBottom:(id)arg1 inBounds:(struct CGSize)arg2 setFrame:(BOOL)arg3;
- (id)accessibilityLabel;
- (id)backgroundControl;
- (float)horizontalMargin;
- (float)horizontalSpacing;
- (id)init;
- (void)layoutSubcontrols;
- (float)nonAxisAlignment;
- (int)panelMode;
- (struct CGPoint)positionForControlAtIndex:(unsigned int)arg1 preSize:(float *)arg2 postSize:(float *)arg3;
- (void)setBackgroundControl:(id)arg1;
- (void)setHorizontalMargin:(float)arg1;
- (void)setHorizontalSpacing:(float)arg1;
- (void)setHorizontalSpacingForPreferredWidth:(float)arg1 minimumSpacing:(float)arg2;
- (void)setNonAxisAlignment:(float)arg1;
- (void)setPanelMode:(int)arg1;
- (void)setVerticalMargin:(float)arg1;
- (void)setVerticalSpacing:(float)arg1;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (float)verticalMargin;
- (float)verticalSpacing;

@end

