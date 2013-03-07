//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImage, NSString;

@interface BRImageControl : BRControl
{
    id <BRImageProxy> _imageProxy;
    BRImage *_image;
    BOOL _renderingImage;
    BOOL _autoDownsample;
    NSString *_artworkIdentifier;
    BOOL _sizeIgnoresPixelBounds;
}

- (void)_imageUpdated:(id)arg1;
- (void)_loadImage;
- (void)_unloadImage;
- (id)accessibilityLabel;
- (float)aspectRatio;
- (BOOL)automaticDownsample;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)dealloc;
- (void)drawInContext:(struct CGContext *)arg1;
- (id)image;
- (struct CGSize)pixelBounds;
- (void)setArtworkIdentifier:(id)arg1;
- (void)setAutomaticDownsample:(BOOL)arg1;
- (void)setImage:(id)arg1;
- (void)setImageAsContents:(id)arg1;
- (void)setImageProxy:(id)arg1;
- (void)setImageProxyAsContents:(id)arg1;
- (void)setSizeIgnoresPixelBounds:(BOOL)arg1;
- (BOOL)sizeIgnoresPixelBounds;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)windowMaxBoundsChanged;

@end

