//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BROptionDialog.h>

@interface BRModalOptionDialog : BROptionDialog
{
    long _cancelIdx;
    BOOL _allowMenuButton;
}

- (void)_done:(id)arg1;
- (BOOL)brEventAction:(id)arg1;
- (id)init;
- (id)initAllowingMenuButton:(BOOL)arg1;
- (long)runModal;
- (void)setCancelIndex:(long)arg1;

@end

