/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRMenuItem.h"

@class NSArray;

@interface BRHiddenSelectionMenuItem : BRMenuItem {
@private
	NSArray *_events;	// 144 = 0x90
	int _eventCount;	// 148 = 0x94
}
@property(retain) NSArray *events;	// G=0x36699059; S=0x36699069; converted property
@property(retain) id hiddenSelectionHandler;	// G=0x366990d5; S=0x366990b9; converted property
- (BOOL)brEventAction:(id)action;	// 0x36698f2d
- (void)dealloc;	// 0x36698ee1
// converted property getter: - (id)events;	// 0x36699059
// converted property getter: - (id)hiddenSelectionHandler;	// 0x366990d5
// converted property setter: - (void)setEvents:(id)events;	// 0x36699069
// converted property setter: - (void)setHiddenSelectionHandler:(id)handler;	// 0x366990b9
@end

