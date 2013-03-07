//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

@class BRImageControl, BRReflectionControl, BRSyncProgressControl, BRTextControl;

@interface BRImageAndSyncingPreviewController : BRControl
{
    BRImageControl *_imageControl;
    BRReflectionControl *_reflectionControl;
    BRSyncProgressControl *_syncProgressControl;
    BRTextControl *_statusTextControl;
    BOOL _hasProgress;
}

- (void)_startSyncingProgress:(id)arg1;
- (void)_stopSyncingProgress:(id)arg1;
- (void)_updateProgress:(id)arg1;
- (void)controlWasActivated;
- (void)dealloc;
- (id)imageControl;
- (id)init;
- (void)layoutSubcontrols;
- (void)setHasSyncProgress:(BOOL)arg1;
- (void)setImage:(id)arg1;
- (void)setReflectionAmount:(float)arg1;
- (void)setReflectionOffset:(float)arg1;
- (void)setStatusMessage:(id)arg1;

@end

