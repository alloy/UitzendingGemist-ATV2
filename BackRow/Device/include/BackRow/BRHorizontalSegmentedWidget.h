//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

@class BRImage, BRImageControl, BRTextControl, NSMutableArray;

@interface BRHorizontalSegmentedWidget : BRControl
{
    BRImage *_leftImage;
    BRImage *_centerImage;
    BRImage *_rightImage;
    BRTextControl *_textControl;
    BRImageControl *_leftEndLayer;
    NSMutableArray *_centerLayers;
    BRImageControl *_rightEndLayer;
    float _animationDuration;
    BOOL _animationEnabled;
    int _numSegments;
}

- (void)_reloadSegments;
- (id)accessibilityLabel;
- (float)animationDuration;
- (id)attributedString;
- (id)centerImage;
- (id)centerLayer;
- (id)centerLayers;
- (void)dealloc;
- (id)init;
- (void)layoutSubcontrols;
- (id)leftEndLayer;
- (id)leftImage;
- (id)rightEndLayer;
- (id)rightImage;
- (void)setAnimationDuration:(float)arg1;
- (void)setAttributedString:(id)arg1;
- (void)setLeftFile:(id)arg1 centerFile:(id)arg2 rightFile:(id)arg3;
- (void)setLeftImage:(id)arg1 centerImage:(id)arg2 rightImage:(id)arg3;
- (void)setNumSegments:(int)arg1;
- (void)setSublayerAnimationEnabled:(BOOL)arg1;
- (void)setText:(id)arg1 withAttributes:(id)arg2;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (BOOL)sublayerAnimationEnabled;

@end

