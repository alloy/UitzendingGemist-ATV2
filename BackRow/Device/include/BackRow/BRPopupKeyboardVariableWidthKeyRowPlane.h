/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import "BRControl.h"


__attribute__((visibility("hidden")))
@interface BRPopupKeyboardVariableWidthKeyRowPlane : BRControl {
@private
	BRControl *_baseKeyControl;	// 48 = 0x30
}
- (id)initWithBaseKeyControl:(id)baseKeyControl;	// 0x366d25f1
- (void)dealloc;	// 0x366d2649
- (void)layoutSubcontrols;	// 0x366d26b9
- (CGSize)performActionWithSubcontrols:(int)subcontrols;	// 0x366d26ed
- (CGSize)sizeThatFits:(CGSize)fits;	// 0x366d2695
@end

