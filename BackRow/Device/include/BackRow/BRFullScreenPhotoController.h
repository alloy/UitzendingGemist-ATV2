//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRController.h"

@class NSMutableArray, NSString;
@protocol BRPhotoProviderForCollection, BRFullScreenPhotoControllerDelegate;

@interface BRFullScreenPhotoController : BRController
{
    long _startIndex;
    long _currentIndex;
    id <BRPhotoProviderForCollection> _provider;
    id <BRFullScreenPhotoControllerDelegate> _delegate;
    BOOL _isNetworkDependent;
    NSMutableArray *_prefetchImageIDs;
    NSString *_lastPrefetchAssetID;
    BOOL _initialLayoutCompleted;
    int _startTouchXPosition;
    float _curTouchOffset;
    BOOL _imagePrefetchDisabled;
    long _numPrefetchInProgress;
}

+ (id)fullScreenPhotoControllerForProvider:(id)arg1 startIndex:(long)arg2;
- (void)_handleSelection;
- (void)_nextSlide;
- (void)_nextSlideWithTransition;
- (void)_playerStateChanged:(id)arg1;
- (void)_prefetchImageWritten:(id)arg1;
- (void)_prefetchNextImage;
- (void)_previousSlide;
- (void)_previousSlideWithTransition;
- (void)_setImageLayerTargetBounds;
- (long)_switchToImageControlForIndex:(long)arg1 usingSwipeTransition:(BOOL)arg2;
- (id)accessibilityLabel;
- (BOOL)brEventAction:(id)arg1;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (long)currentIndex;
- (void)dealloc;
- (BOOL)imagePrefetchDisabled;
- (id)initWithProvider:(id)arg1 startIndex:(long)arg2;
- (BOOL)isAccessibilityElement;
- (BOOL)isNetworkDependent;
- (BOOL)isValidAfterDataUpdate;
- (void)layoutSubcontrols;
@property(readonly, nonatomic) id <BRPhotoProviderForCollection> provider; // @synthesize provider=_provider;
- (void)reload;
- (void)setControllerDelegate:(id)arg1;
- (void)setImagePrefetchDisabled:(BOOL)arg1;
- (void)setIsNetworkDependent:(BOOL)arg1;

@end

