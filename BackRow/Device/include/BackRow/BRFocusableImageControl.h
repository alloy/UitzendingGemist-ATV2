//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRImageControl.h"

@class BRImage;

@interface BRFocusableImageControl : BRImageControl
{
    BRImage *_focusedImage;
    BRImage *_unfocusedImage;
    BRImage *_disabledImage;
    BOOL _dimsWhenDisabled;
    BOOL _disabled;
}

- (void)_updateDim;
- (void)_updateImage;
- (void)controlWasFocused;
- (void)controlWasUnfocused;
- (void)dealloc;
- (BOOL)dimsWhenDisabled;
- (BOOL)disabled;
- (id)disabledImage;
- (id)focusedImage;
- (id)preferredActionForKey:(id)arg1;
- (void)setDimsWhenDisabled:(BOOL)arg1;
- (void)setDisabled:(BOOL)arg1;
- (void)setDisabledImage:(id)arg1;
- (void)setFocusedImage:(id)arg1;
- (void)setUnfocusedImage:(id)arg1;
- (id)unfocusedImage;

@end

