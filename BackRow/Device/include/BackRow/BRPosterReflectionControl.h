/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import "BRControl.h"

@protocol BRPosterImageDataSource;

__attribute__((visibility("hidden")))
@interface BRPosterReflectionControl : BRControl {
@private
	id<BRPosterImageDataSource> _imageDataSource;	// 48 = 0x30
	XXStruct_qlg9jA _cornerRadius;	// 52 = 0x34
	XXStruct_qlg9jA _reflectionHeight;	// 56 = 0x38
}
- (id)initWithImageDataSource:(id)imageDataSource reflectionHeight:(XXStruct_qlg9jA)height cornerRadius:(XXStruct_qlg9jA)radius;	// 0x366f7b5d
- (void)dealloc;	// 0x366f7bc1
- (void)drawInContext:(CGContextRef)context;	// 0x366f7bed
@end

