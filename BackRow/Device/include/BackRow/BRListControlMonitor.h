//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class BRListControl;

@interface BRListControlMonitor : NSObject
{
    BRListControl *_listControl;
    struct _NSRange _loadingRange;
    long _dataCount;
}

- (void)_cancelLoads;
- (void)_listSelectionFinalized:(id)arg1;
- (void)_loadImagesForOnScreenRows;
- (void)cancelCurrentLoads;
- (void)dealloc;
- (void)setListControl:(id)arg1;

@end

