//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRSelectionLozengeLayer.h>

@interface BRBlueGlowSelectionLozengeLayer : BRSelectionLozengeLayer
{
    BOOL _focusedImage;
    BOOL _clearCenter;
}

- (float)bottomGlowHeight;
- (BOOL)clearCenter;
- (void)drawInContext:(struct CGContext *)arg1;
- (float)edgeGlowWidth;
- (id)init;
- (void)setClearCenter:(BOOL)arg1;
- (void)setFocused:(BOOL)arg1;
- (float)topGlowHeight;

@end

