//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRImageControl, BRListControl, BRTextControl;

@interface BRResumeMenuControl : BRControl
{
    BRTextControl *_title;
    BRTextControl *_footnote;
    BRListControl *_resumeMenu;
    BRImageControl *_blurControl;
    float _blurOversizeFactor;
}

- (struct CGColor *)blurControlBackgroundColor;
- (BOOL)brEventAction:(id)arg1;
- (void)dealloc;
- (id)footnote;
- (id)init;
- (void)layoutSubcontrols;
- (id)list;
- (id)preferredActionForKey:(id)arg1;
- (void)setBlurOversizeFactor:(float)arg1;
- (void)setFootnote:(id)arg1;
- (void)setImage:(id)arg1;
- (void)setTitle:(id)arg1;
- (id)title;

@end

