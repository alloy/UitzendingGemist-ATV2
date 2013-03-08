//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRCoverArtImageLayer, BRMetadataControl, BRReflectionControl, NSTimer;

@interface BRMetadataPreviewControl : BRControl
{
    id _asset;
    id <BRMetadataProvider> _metadataProvider;
    BRControl *_coverArtWrapper;
    BRCoverArtImageLayer *_coverArtLayer;
    BRReflectionControl *_reflectionLayer;
    BRMetadataControl *_metadataLayer;
    NSTimer *_timer;
    BOOL _showsMetadataImmediately;
    BOOL _showingMetadata;
}

- (void)_coverArtChanged:(id)arg1;
- (void)_downloadStateChanged:(id)arg1;
- (struct CGRect)_frameForArt:(id)arg1 inBounds:(struct CGSize)arg2;
- (struct CGRect)_frameForArt:(id)arg1 withMetadataFrame:(struct CGRect)arg2 inBounds:(struct CGSize)arg3;
- (struct CGRect)_metadataFrameForBounds:(struct CGSize)arg1;
- (void)_metadataTimerFired:(id)arg1;
- (float)_reflectionAmountForArtFrame:(struct CGRect)arg1 bottomCutoff:(float)arg2;
- (void)_showMetadataAfterDelay;
- (void)_updateMetadataLayer;
- (id)accessibilityLabel;
- (id)asset;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)dealloc;
- (BOOL)deletterboxAssetArtwork;
- (id)init;
- (void)layoutSubcontrols;
- (id)metadataControl;
- (void)setAsset:(id)arg1;
- (void)setDeletterboxAssetArtwork:(BOOL)arg1;
- (void)setImageProxy:(id)arg1;
- (void)setMetadataProvider:(id)arg1;
- (void)setShowsDefaultCoverArt:(BOOL)arg1;
- (void)setShowsMetadataImmediately:(BOOL)arg1;
- (BOOL)showsDefaultCoverArt;
- (BOOL)showsMetadataImmediately;

@end

