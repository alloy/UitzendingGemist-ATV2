//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRMenuItem.h"

@class NSArray;

@interface BRHiddenSelectionMenuItem : BRMenuItem
{
    NSArray *_events;
    int _eventCount;
}

- (BOOL)brEventAction:(id)arg1;
- (void)dealloc;
- (id)events;
- (id)hiddenSelectionHandler;
- (void)setEvents:(id)arg1;
- (void)setHiddenSelectionHandler:(id)arg1;

@end

