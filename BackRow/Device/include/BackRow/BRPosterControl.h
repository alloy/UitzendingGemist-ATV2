//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

#import "BRContainerViewCell.h"
#import "BRMediaShelfViewCell.h"
#import "BRPosterImageDataSource.h"

@class BRAsyncTask, BRAutoScrollingTextControl, BRHorizontalSegmentedWidget, BRImage, BRImageControl, BRPosterReflectionControl, BRTextControl, BRWaitSpinnerControl, NSString;

@interface BRPosterControl : BRControl <BRMediaShelfViewCell, BRContainerViewCell, BRPosterImageDataSource>
{
    int _style;
    BRImageControl *_defaultImageControl;
    BRImage *_defaultImage;
    BRControl *_imageControl;
    BRImage *_image;
    id <BRImageProxy> _imageProxy;
    int _imageSize;
    BRHorizontalSegmentedWidget *_numberBadge;
    int _numberBadgeValue;
    struct CGColor *_posterBorderColor;
    float _posterBorderWidth;
    BOOL _drawFakeAntialiasTopLine;
    BOOL _imageRequested;
    NSString *_artworkIdentifier;
    BRAsyncTask *_imageTask;
    BRPosterReflectionControl *_reflectionControl;
    float _reflectionAmount;
    float _reflectionBaseline;
    BRTextControl *_ordinalTextControl;
    BRAutoScrollingTextControl *_autoScrollingTitleControl;
    BRTextControl *_subtitleTextControl;
    float _titleWidthScale;
    float _titleVerticalOffset;
    float _subtitleVerticalOffset;
    BOOL _alwaysShowTitles;
    BOOL _onlyShowSubtitlesWhenFocused;
    BRWaitSpinnerControl *_spinnerControl;
    CDStruct_1420b1e7 _cornerRadius;
    float _cropAspectRatio;
    BOOL _cropAndFill;
    BOOL _deletterboxImage;
    BRImageControl *_badgeImageControl;
    BRImage *_badgeImage;
    float _badgeScale;
    float _badgeOpacity;
    float _badgeFocusedOpacity;
    int _badgePosition;
    BOOL _badgeUpdated;
    BRImage *_borderImage;
    struct CGRect _borderImageFocusRect;
    struct CGRect _borderImagePhotoImageRect;
    NSString *_accessibilityLabel;
    BOOL _decoratedImageCacheEnabled;
    BOOL _usingDecoratedImage;
    BOOL _imageEdgeAntialiasingEnabled;
    CDUnknownBlockType _loadCompletionBlock;
    BOOL _readyToDisplay;
    BOOL _ignoreLoadAndDisplayOnDemand;
    BOOL _disableAnimations;
}

+ (void)initialize;
+ (Class)layerClass;
+ (id)polaroidPosterWithImageProxy:(id)arg1 title:(id)arg2;
+ (id)posterButtonWithImageProxy:(id)arg1 title:(id)arg2;
+ (id)tilePosterWithImageProxy:(id)arg1 title:(id)arg2 subtitle:(id)arg3;
+ (id)twoLinePosterButtonWithImageProxy:(id)arg1 title:(id)arg2 subtitle:(id)arg3;
- (id)_addFadeAnimationToLayer:(id)arg1 forKey:(id)arg2;
- (id)_artworkIdentifier;
- (void)_clearCurrentImage;
- (void)_cropImage:(id)arg1;
- (id)_currentImage;
- (struct CGRect)_currentImageRect;
- (void)_decorateImage:(id)arg1;
- (id)_decoratedImageIdentifier:(id)arg1 size:(struct CGSize)arg2;
- (void)_deletterboxImage:(id)arg1;
- (id)_fetchImage;
- (void)_focusWasChanged;
- (id)_getDecoratedImage:(id)arg1 imageID:(id)arg2 toSize:(struct CGSize)arg3 writeToDisk:(BOOL)arg4;
- (id)_getImageFromCacheNamed:(id)arg1 withSize:(struct CGSize)arg2;
- (BOOL)_imageIsCorrectSize:(id)arg1 requiresTask:(char *)arg2 requiresDeletterBox:(char *)arg3;
- (void)_imageLoadFailed:(id)arg1;
- (BOOL)_imageRequiresCrop;
- (int)_imageSize;
- (void)_imageTaskComplete:(id)arg1;
- (void)_imageUpdated:(id)arg1;
- (void)_lowMemoryNotification:(id)arg1;
- (struct CGRect)_mainImageRectFromMainImageUnitRect;
- (struct CGRect)_maxImageRect;
- (id)_numberBadgeAttributes;
- (id)_ordinalAttributes;
- (void)_performDeactivation;
- (BOOL)_resizeImage:(id)arg1;
- (void)_restartImageResizing;
- (void)_scaleImage:(id)arg1;
- (void)_setArtworkIdentifier:(id)arg1;
- (void)_setAttributedTitle:(id)arg1 withCrossfade:(BOOL)arg2;
- (void)_setFinalFormImage:(id)arg1;
- (void)_startDeletterboxTaskForImage:(id)arg1;
- (void)_startImageProcessingTaskForImage:(id)arg1;
- (id)_subtitleAttributes;
- (id)_titleAttributes;
- (void)_updateDefaultArtwork;
- (void)_updateDeferredArtwork;
- (void)_updateTextLayerOpacity;
- (id)accessibilityLabel;
- (id)accessibilitySecondaryLabel;
- (BOOL)alwaysShowTitles;
- (id)badge;
- (id)badgeImage;
- (float)badgeOpacity;
- (int)badgePosition;
- (float)badgeScale;
- (void)cancelContainerViewLoad;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)controlWasFocused;
- (void)controlWasUnfocused;
- (CDStruct_1420b1e7)cornerRadius;
- (BOOL)cropAndFill;
- (float)cropAspectRatio;
- (void)dealloc;
- (id)defaultImage;
- (BOOL)deletterboxImage;
- (id)description;
- (BOOL)drawsFakeAntiAliasTopLine;
- (struct CGRect)focusCursorFrame;
- (float)focusedBadgeOpacity;
- (void)hideTextLayers;
- (id)image;
- (id)imageProxy;
- (id)init;
- (BOOL)isAccessibilityElement;
- (void)layoutSubcontrols;
- (void)loadWithCompletionBlock:(CDUnknownBlockType)arg1;
- (int)numberBadgeValue;
- (BOOL)onlyShowSubtitlesWhenFocused;
- (int)ordinal;
- (struct CGColor *)posterBorderColor;
- (float)posterBorderWidth;
- (id)posterImage;
- (int)posterStyle;
- (float)preferredCursorRadius;
- (float)reflectionAmount;
- (float)reflectionBaseline;
- (void)setAccessibilityLabel:(id)arg1;
- (void)setAlwaysShowTitles:(BOOL)arg1;
- (void)setBadgeImage:(id)arg1 atPosition:(int)arg2;
- (void)setBadgeOpacity:(float)arg1;
- (void)setBadgeScale:(float)arg1;
- (void)setCornerRadius:(CDStruct_1420b1e7)arg1;
- (void)setCropAndFill:(BOOL)arg1;
- (void)setCropAspectRatio:(float)arg1;
- (void)setDefaultImage:(id)arg1;
- (void)setDeletterboxImage:(BOOL)arg1;
- (void)setDrawsFakeAntialiasTopLine:(BOOL)arg1;
- (BOOL)setEnableDecoratedImageCache:(BOOL)arg1;
- (void)setFocusedBadgeOpacity:(float)arg1;
- (void)setIgnoreLoadAndDisplayOnDemand;
- (void)setIgnoreLoadAndDisplayOnDemandDisableAnimations:(BOOL)arg1;
- (void)setImageEdgeAntialiasingEnabled:(BOOL)arg1;
- (void)setImageProxy:(id)arg1;
- (void)setImageProxy:(id)arg1 withSize:(int)arg2;
- (void)setNonAttributedSubtitle:(id)arg1;
- (void)setNonAttributedTitle:(id)arg1;
- (void)setNonAttributedTitleWithCrossfade:(id)arg1;
- (void)setNumberBadgeValue:(int)arg1;
- (void)setOnlyShowSubtitlesWhenFocused:(BOOL)arg1;
- (void)setOrdinal:(int)arg1;
- (void)setPosterBorderColor:(struct CGColor *)arg1;
- (void)setPosterBorderWidth:(float)arg1;
- (void)setPosterStyle:(int)arg1;
- (void)setReadyToDisplay;
- (void)setReflectionAmount:(float)arg1;
- (void)setReflectionBaseline:(float)arg1;
- (void)setSpinnerEnabled:(BOOL)arg1;
- (void)setSubtitle:(id)arg1;
- (void)setSubtitleVerticalOffset:(float)arg1;
- (void)setTitle:(id)arg1;
- (void)setTitleVerticalOffset:(float)arg1;
- (void)setTitleWidthScale:(float)arg1;
- (void)setTitleWithCrossfade:(id)arg1;
- (BOOL)spinnerEnabled;
- (id)subtitle;
- (float)subtitleVerticalOffset;
- (id)title;
- (id)titleControl;
- (float)titleVerticalOffset;
- (float)titleWidthScale;
- (void)windowMaxBoundsChanged;

@end

