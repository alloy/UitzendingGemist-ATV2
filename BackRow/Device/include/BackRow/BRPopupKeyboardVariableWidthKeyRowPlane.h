//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

__attribute__((visibility("hidden")))
@interface BRPopupKeyboardVariableWidthKeyRowPlane : BRControl
{
    BRControl *_baseKeyControl;
}

- (void)dealloc;
- (id)initWithBaseKeyControl:(id)arg1;
- (void)layoutSubcontrols;
- (struct CGSize)performActionWithSubcontrols:(int)arg1;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;

@end

