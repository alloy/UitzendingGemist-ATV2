/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import "BRControl.h"


@interface BRDropShadowControl : BRControl {
@private
	BRControl *_content;	// 48 = 0x30
	int _shadowStyle;	// 52 = 0x34
	float _sizeFactor;	// 56 = 0x38
}
@property(retain) BRControl *content;	// G=0x3668f51d; S=0x3668f4ad; converted property
@property(assign) float shadowSizeFactor;	// G=0x3668f49d; S=0x3668f461; converted property
@property(assign) int shadowStyle;	// G=0x3668f451; S=0x3668f425; converted property
- (id)init;	// 0x3668f379
- (void)_updateImages;	// 0x3668f7e5
// converted property getter: - (id)content;	// 0x3668f51d
- (void)dealloc;	// 0x3668f3d9
- (void)layoutSubcontrols;	// 0x3668f52d
// converted property setter: - (void)setContent:(id)content;	// 0x3668f4ad
// converted property setter: - (void)setShadowSizeFactor:(float)factor;	// 0x3668f461
// converted property setter: - (void)setShadowStyle:(int)style;	// 0x3668f425
// converted property getter: - (float)shadowSizeFactor;	// 0x3668f49d
// converted property getter: - (int)shadowStyle;	// 0x3668f451
@end

