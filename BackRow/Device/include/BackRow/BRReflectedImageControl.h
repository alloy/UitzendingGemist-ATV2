//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImageControl, BRReflectionControl;

@interface BRReflectedImageControl : BRControl
{
    BRImageControl *_image;
    BRReflectionControl *_reflection;
    float _offset;
}

- (BOOL)automaticDownsample;
- (void)dealloc;
- (id)image;
- (struct CGColor *)imageBorderColor;
- (float)imageBorderWidth;
- (id)init;
- (void)layoutSubcontrols;
- (struct CGRect)reflectedImageFrameForImageFrame:(struct CGRect)arg1 reflectionAmount:(float)arg2;
- (float)reflectionOffset;
- (void)setAutomaticDownsample:(BOOL)arg1;
- (void)setImage:(id)arg1;
- (void)setImageAsContents:(id)arg1;
- (void)setImageBorderColor:(struct CGColor *)arg1;
- (void)setImageBorderWidth:(float)arg1;
- (void)setReflectionOffset:(float)arg1;

@end

