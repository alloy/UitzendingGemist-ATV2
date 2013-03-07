//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "BRProvider.h"

@class BRMediaPlayer, NSTimer;

__attribute__((visibility("hidden")))
@interface BRVideoChapterProvider : NSObject <BRProvider>
{
    BRMediaPlayer *_player;
    struct _NSRange _invalidTitlesRange;
    NSTimer *_checkForChapterTitleUpdateTimer;
}

- (void)_checkChapterTitle:(id)arg1;
- (void)_movieLoadedHandler:(id)arg1;
- (BOOL)_videoIsLoaded;
- (id)controlFactory;
- (id)dataAtIndex:(long)arg1;
- (long)dataCount;
- (void)dealloc;
- (id)hashForDataAtIndex:(long)arg1;
- (id)initWithPlayer:(id)arg1;
- (void)stopMonitoring;

@end

