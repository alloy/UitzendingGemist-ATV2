//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

@class BRImageControl, BRListView, BRScrollControl, BRTextControl;

@interface BRMenuView : BRControl
{
    float _verticalSpacer;
    BRImageControl *_titleImage;
    float _titleImageVerticalOffset;
    BRTextControl *_title;
    BRTextControl *_description;
    BRListView *_list;
    BRScrollControl *_scroller;
    int _listAlignment;
    CDStruct_1420b1e7 _listWidth;
    CDStruct_1420b1e7 _listLeadingGap;
    CDStruct_1420b1e7 _listTrailingGap;
}

+ (id)menuViewWithListAlignment:(int)arg1;
- (id)accessibilityLabel;
- (id)accessibilitySecondaryLabel;
- (void)dealloc;
- (id)description;
- (id)init;
- (id)initWithListAlignment:(int)arg1;
- (void)layoutSubcontrols;
- (id)list;
@property(readonly, nonatomic) int listAlignment; // @synthesize listAlignment=_listAlignment;
- (struct CGRect)listFrame;
@property(nonatomic) CDStruct_1420b1e7 listLeadingGap; // @synthesize listLeadingGap=_listLeadingGap;
@property(nonatomic) CDStruct_1420b1e7 listTrailingGap; // @synthesize listTrailingGap=_listTrailingGap;
@property(nonatomic) CDStruct_1420b1e7 listWidth; // @synthesize listWidth=_listWidth;
- (void)setDescription:(id)arg1;
- (void)setDescription:(id)arg1 withAttributes:(id)arg2;
- (void)setListFrame:(struct CGRect)arg1;
- (void)setTitle:(id)arg1;
- (void)setTitle:(id)arg1 withAttributes:(id)arg2;
- (void)setTitleImage:(id)arg1 withVerticalOffset:(float)arg2;
- (void)setVerticalSpacer:(float)arg1;
- (id)title;

@end

