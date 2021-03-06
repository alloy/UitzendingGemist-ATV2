//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImageControl, NSArray, NSMutableArray, NSMutableDictionary;

@interface BRSegmentedSortControl : BRControl
{
    BRImageControl *_leftEndCapLayer;
    NSMutableArray *_dividerLayers;
    NSMutableArray *_contentLayers;
    NSMutableArray *_textLayers;
    BRImageControl *_rightEndCapLayer;
    NSArray *_segmentNames;
    NSMutableDictionary *_images;
    int _selectedSegment;
    float _widthRatio;
}

- (id)_attributedTextForSegment:(int)arg1 forSelectedState:(BOOL)arg2;
- (id)_contentBackgroundTextureForSelectedState:(BOOL)arg1;
- (id)_dividerTextureForSelectedState:(BOOL)arg1;
- (id)_leftEndCapTexureForSelectedState:(BOOL)arg1;
- (id)_loadImageFromFile:(id)arg1;
- (id)_rightEndCapTexureForSelectedState:(BOOL)arg1;
- (void)_updateSegmentState;
- (id)accessibilityLabel;
- (BOOL)brEventAction:(id)arg1;
- (void)dealloc;
- (id)initWithSegmentNames:(id)arg1 selectedSegment:(int)arg2;
- (id)initWithSegmentNames:(id)arg1 selectedSegment:(int)arg2 widthRatio:(float)arg3;
- (void)layoutSubcontrols;
- (int)segmentCount;
- (int)selectedSegment;
- (void)setSelectedSegment:(int)arg1;
- (float)visualHorizontalCenter;

@end

