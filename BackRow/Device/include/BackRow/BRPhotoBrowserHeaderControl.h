//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class BRDividerControl, BRImageControl, BRTextControl, NSString;

__attribute__((visibility("hidden")))
@interface BRPhotoBrowserHeaderControl : BRControl
{
    BRTextControl *_titleControl;
    BRTextControl *_rightJustifiedTextControl;
    BRTextControl *_subtitleControl;
    BRImageControl *_icon;
    BRDividerControl *_divider;
    NSString *_title;
    long _count;
    BOOL _displaysCount;
    float _iconVerticalOffset;
}

- (id)accessibilityLabel;
- (long)count;
- (void)dealloc;
- (BOOL)displaysCount;
- (float)dividerBrightness;
- (id)icon;
- (float)iconVerticalOffset;
- (id)init;
- (void)layoutSubcontrols;
- (id)photoBrowserHeader;
@property(copy, nonatomic) NSString *rightJustifiedText;
- (void)setCount:(long)arg1;
- (void)setDisplaysCount:(BOOL)arg1;
- (void)setDividerBrightness:(float)arg1;
- (void)setIcon:(id)arg1;
- (void)setIconVerticalOffset:(float)arg1;
- (void)setSubtitle:(id)arg1;
- (void)setTitle:(id)arg1;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (id)subtitle;
- (id)title;

@end

