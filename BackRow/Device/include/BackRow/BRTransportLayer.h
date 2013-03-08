//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImage, BRWaitSpinnerControl, NSArray, NSMutableDictionary;

__attribute__((visibility("hidden")))
@interface BRTransportLayer : BRControl
{
    BOOL _zeroDuration;
    BOOL _drawsBetweenLeftEdgeAndBufferEdge;
    BOOL _useWideLeftEndCap;
    BOOL _playerStateHidden;
    float _percentComplete;
    struct _NSRange _downloadedRange;
    int _currentState;
    NSMutableDictionary *_cachedImages;
    struct CGRect _leftEndCapBounds;
    struct CGRect _rightEndCapBounds;
    struct CGRect _leftEndCapExtensionBounds;
    BRImage *_leftEndCap;
    BRImage *_leftEndCapPiece;
    BRImage *_rightEndCap;
    struct CGRect _leftProgressEndCapBounds;
    struct CGRect _rightProgressEndCapBounds;
    BRImage *_leftProgressEndCap;
    BRImage *_rightProgressEndCap;
    BRImage *_leftProgressUnbufferedEndCap;
    struct CGRect _leftGrayBarBounds;
    struct CGRect _rightGrayBarBounds;
    BRImage *_grayBarPiece;
    struct CGRect _rightGrayEndCapBounds;
    BRImage *_rightGrayEndCap;
    struct CGRect _leftWhiteBarBounds;
    struct CGRect _rightWhiteBarBounds;
    BRImage *_whiteBarPiece;
    struct CGRect _blueAlreadyPlayedBounds;
    BRImage *_blueAlreadyPlayed;
    struct CGRect _chapterMarkerBounds;
    NSArray *_chapterMarkers;
    NSArray *_interstitialMarkers;
    BRImage *_interstitialOnImage;
    BRImage *_interstitialOffImage;
    long _currentInterstitialIndex;
    float _temporaryMarkerPositionPercentage;
    BOOL _showChapterMarkers;
    struct CGRect _playheadBounds;
    BRImage *_playhead;
    struct CGSize _dynamicBounds;
    struct CGSize _staticBounds;
    BRWaitSpinnerControl *_spinner;
}

- (id)_cachedImageForName:(id)arg1;
- (void)_drawChapterMarkersInContext:(struct CGContext *)arg1;
- (void)_drawInterstitialMarkersInContext:(struct CGContext *)arg1;
- (id)_loadImageForName:(id)arg1;
- (void)_updateDynamicFrames;
- (void)_updateLeftEnd;
- (void)_updateStaticFrames;
- (void)dealloc;
- (void)drawInContext:(struct CGContext *)arg1;
- (id)initWithSpinner:(BOOL)arg1;
- (void)layoutSubcontrols;
- (struct CGRect)leftEndCapRenderableArea;
- (float)playheadPosition;
- (struct CGRect)rightEndCapFrame;
- (void)setChapterMarkers:(id)arg1 withTemporaryMarker:(float)arg2;
- (void)setCurrentInterstitialIndex:(long)arg1;
- (void)setDownloadedRange:(struct _NSRange)arg1;
- (void)setDrawsBetweenLeftEdgeAndBufferEdge:(BOOL)arg1;
- (void)setInterstitialMarkers:(id)arg1;
- (void)setPercentComplete:(float)arg1;
- (void)setPlayerStateHidden:(BOOL)arg1;
- (void)setShowChapterMarks:(BOOL)arg1;
- (void)setState:(int)arg1;
- (void)setUseWideLeftEndCap:(BOOL)arg1;
- (void)setZeroDuration:(BOOL)arg1;
- (BOOL)showChapterMarks;

@end

