//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@protocol BRPlayerDelegate <NSObject>

@optional
- (void)menuActionForPlayer:(id)arg1;
- (BOOL)player:(id)arg1 shouldHandleEvent:(id)arg2 playerTime:(double)arg3;
- (double)player:(id)arg1 willSeekToTime:(double)arg2;
- (void)playerEndedForPlayer:(id)arg1;
- (BOOL)retryPlaybackForPlayer:(id)arg1 onError:(id)arg2;
@end

