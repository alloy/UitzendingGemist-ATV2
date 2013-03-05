/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import "BRControl.h"


@interface BRWaitSpinnerControl : BRControl {
@private
	BOOL _spins;	// 49 = 0x31
	CGImageRef _spinnerImage;	// 52 = 0x34
}
@property(assign) BOOL spins;	// G=0x366e3845; S=0x366e34c9; converted property
- (id)init;	// 0x366e3281
- (void)_setAnimation;	// 0x366e355d
- (id)accessibilityLabel;	// 0x366e3919
- (void)controlWasActivated;	// 0x366e3855
- (void)controlWasDeactivated;	// 0x366e38a5
- (void)dealloc;	// 0x366e3489
- (BOOL)isAccessibilityElement;	// 0x366e3915
// converted property setter: - (void)setSpins:(BOOL)spins;	// 0x366e34c9
// converted property getter: - (BOOL)spins;	// 0x366e3845
@end

