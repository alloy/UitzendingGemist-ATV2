/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import <NSObject.h> // Unknown library
#import "BRMarqueeScrollingDelegate.h"

@class NSMutableArray;

__attribute__((visibility("hidden")))
@interface BRMarqueeStack : NSObject <BRMarqueeScrollingDelegate> {
@private
	NSMutableArray *_controlStack;	// 4 = 0x4
	unsigned _currentScrollingControlIndex;	// 8 = 0x8
	BOOL _isFirstRun;	// 12 = 0xc
	BOOL _shouldStopAllScrolling;	// 13 = 0xd
	BOOL _shouldAnimateOnce;	// 14 = 0xe
	BOOL _allowsSimultaneousScrollingControls;	// 15 = 0xf
	unsigned _maxSimultaneousScrollingControls;	// 16 = 0x10
	int _transitionDirection;	// 20 = 0x14
}
@property(assign) BOOL allowsSimultaneousScrollingControls;	// G=0x366a8dad; S=0x366a8d9d; converted property
@property(assign) unsigned maxSimultaneousScrollingControls;	// G=0x366a8dcd; S=0x366a8dbd; converted property
@property(assign) int transitionDirection;	// G=0x366a8d6d; S=0x366a8d5d; converted property
- (id)init;	// 0x366a8c65
- (int)_indexOfFirstControlInNeedOfAnimation;	// 0x366a91c5
- (int)_indexOfNextControlInNeedOfScrollingFromIndex:(unsigned)index;	// 0x366a91d9
- (void)addControlToStack:(id)stack;	// 0x366a8ddd
- (void)addControlToStack:(id)stack atIndex:(unsigned)index;	// 0x366a8df1
// converted property getter: - (BOOL)allowsSimultaneousScrollingControls;	// 0x366a8dad
- (void)controlDidFinishingScrolling:(id)control;	// 0x366a9069
- (void)dealloc;	// 0x366a8bb1
// converted property getter: - (unsigned)maxSimultaneousScrollingControls;	// 0x366a8dcd
- (void)removeControlFromStack:(id)stack;	// 0x366a8e71
// converted property setter: - (void)setAllowsSimultaneousScrollingControls:(BOOL)controls;	// 0x366a8d9d
// converted property setter: - (void)setMaxSimultaneousScrollingControls:(unsigned)controls;	// 0x366a8dbd
- (void)setShouldAnimateOnce:(BOOL)animateOnce;	// 0x366a8d8d
- (void)setShouldStopAllScrolling:(BOOL)stopAllScrolling;	// 0x366a8d7d
// converted property setter: - (void)setTransitionDirection:(int)direction;	// 0x366a8d5d
- (BOOL)shouldControlWaitToScroll:(id)scroll;	// 0x366a8eb1
- (id)stack;	// 0x366a8d31
// converted property getter: - (int)transitionDirection;	// 0x366a8d6d
@end

