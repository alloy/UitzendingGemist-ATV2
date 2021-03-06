//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

#import "BRTransportDataProvider-Protocol.h"

@interface BRVideoCacheManager : BRSingleton <BRTransportDataProvider>
{
}

+ (void)setImplementationClass:(Class)arg1;
+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (struct BRTimeRange)bufferedRange;
- (float)bufferingProgress;
- (id)cacheInfoForAsset:(id)arg1;
- (id)chapterAtIndex:(long)arg1;
- (id)chapterGroupAtIndex:(long)arg1;
- (long)chapterGroupCount;
- (long)chapterGroupIndex;
- (id)chapters;
- (long)currentChapterIndex;
- (long)currentInterstitialIndex;
- (id)currentPlayer;
- (id)currentPlayerItem;
- (id)currentPlayerLayer;
- (double)duration;
- (double)elapsedTime;
- (void)evictAsset:(id)arg1;
- (void)evictURL:(id)arg1;
- (id)interstitialTimes;
- (BOOL)isAssetReadyToPlay:(id)arg1;
- (BOOL)isItemLoading:(struct __ATVMediaItem *)arg1;
- (BOOL)isItemReadyToPlay:(struct __ATVMediaItem *)arg1;
- (id)playbackDate;
- (int)playerState;
- (void)saveCacheKey:(id)arg1 forAsset:(id)arg2;
- (void)saveCacheKey:(id)arg1 forURL:(id)arg2;
- (double)secondsUntilItemWillBeReadyToPlay:(struct __ATVMediaItem *)arg1;
- (id)selectableAudioTracks;
- (void)setDelegate:(id)arg1;
- (void)startCachingAVAsset:(id)arg1 mediaItem:(struct __ATVMediaItem *)arg2 withElapsedTime:(double)arg3;
- (void)startCachingItem:(struct __ATVMediaItem *)arg1;
- (void)startCachingItem:(struct __ATVMediaItem *)arg1 withElapsedTime:(double)arg2;
- (void)startCachingURL:(id)arg1;
- (void)stopCaching;
- (id)subtitleTracks;
- (BOOL)supportsBufferedRange;
- (double)videoStartTime;
- (double)virtualChapterMark;

@end

