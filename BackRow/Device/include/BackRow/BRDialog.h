//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class BRControl, BRWindow, NSString;

@interface BRDialog : NSObject
{
    BRWindow *_window;
    BRControl *_control;
    NSString *_identifier;
}

+ (void)dismissDialogWithIdentifier:(id)arg1;
+ (void)initialize;
+ (BOOL)isDialogCurrentlyPosted;
+ (BOOL)isDialogPostedWithIdentifier:(id)arg1;
+ (void)postDialogWithControl:(id)arg1 identifier:(id)arg2;
+ (void)postDialogWithControl:(id)arg1 identifier:(id)arg2 style:(int)arg3 opaque:(BOOL)arg4;
+ (void)postModalDialog:(id)arg1;
+ (void)postModalDialogWithControl:(id)arg1 identifier:(id)arg2;
+ (void)postModalDialogWithControl:(id)arg1 identifier:(id)arg2 style:(int)arg3 opaque:(BOOL)arg4;
+ (void)postModalDialogWithController:(id)arg1 identifier:(id)arg2;
+ (void)postModalDialogWithController:(id)arg1 identifier:(id)arg2 style:(int)arg3 opaque:(BOOL)arg4;
- (void)_dialogStackBankrupt:(id)arg1;
- (void)_transitionCompleted:(id)arg1;
- (id)control;
- (void)dealloc;
- (id)identifier;
- (id)initWithControl:(id)arg1 identifier:(id)arg2 style:(int)arg3 opaque:(BOOL)arg4;
- (void)transitionIn;
- (void)transitionOut;

@end

