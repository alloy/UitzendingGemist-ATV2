//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

@class BRImage, BRMediaPlayer, NSAttributedString, NSString, NSTimer;

__attribute__((visibility("hidden")))
@interface BRDescriptionOverlayControl : BRControl
{
    BRControl *_customOverlay;
    struct CGColor *_fillColor;
    BRMediaPlayer *_player;
    id <BRMediaAsset> _asset;
    NSString *_imageID;
    BRImage *_image;
    BRImage *_ratingImage;
    NSAttributedString *_title;
    NSAttributedString *_publisher;
    NSAttributedString *_description;
    NSAttributedString *_pressAndHoldDescription;
    BOOL _showPressAndHoldDescription;
    NSTimer *_fadeTimer;
}

- (void)_fadeOverlay:(id)arg1;
- (void)_hideOverlay;
- (void)_imageUpdated:(id)arg1;
- (id)_pressAndHoldDescriptionAttributes;
- (BOOL)_pressAndHoldOptionAvailable;
- (void)_setImage:(id)arg1;
- (void)_showOverlay;
- (void)_showOverlayWithTimeout:(float)arg1;
- (void)_updateCurrentMediaInfo;
- (id)accessibilityLabel;
- (void)animationDidStop:(id)arg1 finished:(BOOL)arg2;
- (void)dealloc;
- (void)drawInContext:(struct CGContext *)arg1;
- (BOOL)hasContent;
- (void)hideOverlay;
- (id)init;
- (BOOL)isAccessibilityElement;
- (void)layoutSubcontrols;
- (void)setAsset:(id)arg1;
- (void)setPlayer:(id)arg1;
- (void)showOverlayWithLongTimeout;
- (void)showOverlayWithLongTimeoutFromTouchRemote;
- (void)showOverlayWithShortTimeout;

@end

