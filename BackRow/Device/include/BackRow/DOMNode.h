/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/BackRow.framework/BackRow
 */

#import "BackRow-Structs.h"


@interface DOMNode (Geometry)
- (BOOL)fitsInRect:(CGRect)rect;	// 0x3165b8b1
@end

@interface DOMNode (TextEntryAssistants)
@property(retain) id nodeStringValue;	// G=0x3165b699; S=0x3165b69d; converted property
- (int)formPeriperalType;	// 0x3165b695
- (BOOL)isSecure;	// 0x3165b68d
- (BOOL)isTextControl;	// 0x3165b689
- (BOOL)nodeCanBecomeFirstResponder;	// 0x3165b691
// converted property getter: - (id)nodeStringValue;	// 0x3165b699
// converted property setter: - (void)setNodeStringValue:(id)value;	// 0x3165b69d
@end

@interface DOMNode (Clickability)
- (id)clickableDecendents;	// 0x3165b789
- (BOOL)respondsToClick;	// 0x3165b881
@end
