//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BROptionDialog.h"

@class BRMediaHost;

__attribute__((visibility("hidden")))
@interface BRMediaHostDisconnectedDialog : BROptionDialog
{
    BRMediaHost *_mediaHost;
    unsigned int _timerSatisfied:1;
}

- (void)_checkHostStatus:(id)arg1;
- (void)dealloc;
- (void)goToSources;
- (id)initWithHost:(id)arg1;
- (id)mediaHost;
- (void)setMediaHost:(id)arg1;
- (void)wasPushed;

@end

