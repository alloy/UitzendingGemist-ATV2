//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@interface BRMediaUtilities : NSObject
{
}

+ (void)_logDownloadKeyCookies;
+ (id)defaultImageForMediaCollection:(struct __ATVMediaCollection *)arg1 imageSize:(int)arg2;
+ (id)defaultImageForMediaItem:(struct __ATVMediaItem *)arg1 imageSize:(int)arg2;
+ (void)deleteAllPlaybackCookies;
+ (void)deleteCookiesForAsset:(id)arg1;
+ (BOOL)iTunesServerID:(id)arg1 isEqualToITunesServerID:(id)arg2;
+ (BOOL)isAirPlayAsset:(id)arg1;
+ (BOOL)isHomeShareRental:(id)arg1;
+ (BOOL)isSagaMediaAsset:(id)arg1;
+ (BOOL)isSagaMediaItem:(struct __ATVMediaItem *)arg1;
+ (BOOL)isTrilogyMediaAsset:(id)arg1;
+ (BOOL)isTrilogyMediaItem:(struct __ATVMediaItem *)arg1;
+ (BOOL)isiTunesAsset:(id)arg1;
+ (BOOL)isiTunesMediaItem:(struct __ATVMediaItem *)arg1;
+ (id)mediaAssetsFromMediaItems:(id)arg1;
+ (id)mediaTypeForATVMediaType:(struct __ATVMediaType *)arg1;
+ (id)mediaTypeForMediaCollection:(struct __ATVMediaCollection *)arg1;
+ (id)mediaTypeForMediaItem:(struct __ATVMediaItem *)arg1;
+ (double)playedThresholdForMediaItem:(struct __ATVMediaItem *)arg1;
+ (double)playedThresholdForMediaType:(struct __ATVMediaType *)arg1 duration:(double)arg2;
+ (void)setCookiesForAsset:(id)arg1;
+ (float)soundCheckValueForMediaAsset:(id)arg1;
+ (float)soundCheckValueForMediaItem:(struct __ATVMediaItem *)arg1;
+ (int)watchedStateForMediaItem:(struct __ATVMediaItem *)arg1;
+ (int)watchedStateForMediaType:(struct __ATVMediaType *)arg1 duration:(double)arg2 bookmarkInMS:(long)arg3 hasBeenPlayed:(BOOL)arg4 playCount:(long)arg5;

@end

