//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRDividerControl, BRImageControl, BRTextControl, NSArray, NSNumber;

@interface BRMetadataLongDescriptionControl : BRControl
{
    BRTextControl *_titleLayer;
    BRTextControl *_titleSubtextLayer;
    BRTextControl *_priceLayer;
    BRControl *_formatControl;
    BRTextControl *_releaseDateLayer;
    BRTextControl *_lengthLayer;
    BRTextControl *_studioNameLayer;
    BRImageControl *_ratingImageLayer;
    BRControl *_userRatingControl;
    BRImageControl *_topRightImageLayer;
    BRTextControl *_summaryLayer;
    BRTextControl *_copyrightLayer;
    NSNumber *_trackNumber;
    BRDividerControl *_topDivider;
    BRDividerControl *_bottomDivider;
    NSArray *_metadataObjs;
    NSArray *_metadataLabels;
    float _totalHeight;
    int _alignment;
    struct CGSize _artworkSize;
}

- (void)_setCopyright:(id)arg1;
- (void)_setFormatControl:(id)arg1;
- (void)_setLength:(id)arg1;
- (void)_setMetadata:(id)arg1 withLabels:(id)arg2;
- (void)_setPrice:(id)arg1;
- (void)_setRating:(id)arg1;
- (void)_setReleaseDate:(id)arg1;
- (void)_setStudioName:(id)arg1;
- (void)_setSummary:(id)arg1;
- (void)_setTitle:(id)arg1;
- (void)_setTitleSubtext:(id)arg1;
- (void)_setTopRightImage:(id)arg1;
- (void)_setTrackNumber:(id)arg1;
- (void)_setUserRatingControl:(id)arg1;
- (id)accessibilityScreenContent;
- (void)dealloc;
- (id)init;
- (void)layoutSubcontrols;
- (struct CGSize)renderedSize;
- (void)resetAllFields;
- (void)setAlignment:(int)arg1;
- (void)setArtworkSize:(struct CGSize)arg1;
- (void)setCopyright:(id)arg1;
- (void)setFormatControl:(id)arg1;
- (void)setLength:(id)arg1;
- (void)setMetadata:(id)arg1 withLabels:(id)arg2;
- (void)setPrice:(id)arg1;
- (void)setRating:(id)arg1;
- (void)setReleaseDate:(id)arg1;
- (void)setStudioName:(id)arg1;
- (void)setSummary:(id)arg1;
- (void)setTitle:(id)arg1;
- (void)setTitleSubtext:(id)arg1;
- (void)setTopRightImage:(id)arg1;
- (void)setTrackNumber:(id)arg1;
- (void)setUserRatingControl:(id)arg1;
- (id)topRightImageControl;
- (void)windowMaxBoundsChanged;

@end

