/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import <NSObject.h> // Unknown library
#import "BRImageProxy.h"

@class BRXMLMediaAsset;

__attribute__((visibility("hidden")))
@interface BRXMLImageProxy : NSObject <BRImageProxy> {
@private
	BRXMLMediaAsset *_asset;	// 4 = 0x4
}
+ (id)imageProxyForAsset:(id)asset;	// 0x3666ae79
- (id)initWithAsset:(id)asset;	// 0x3666aec1
- (void)cancelImageRequestsForImageSizes:(int)imageSizes;	// 0x3666b0dd
- (void)dealloc;	// 0x3666af19
- (id)defaultImageForImageSize:(int)imageSize;	// 0x3666b01d
- (id)imageForImageSize:(int)imageSize;	// 0x3666afc1
- (id)imageIDForImageSize:(int)imageSize;	// 0x3666af65
- (id)object;	// 0x3666b0e1
- (BOOL)supportsImageForImageSize:(int)imageSize;	// 0x3666b069
@end

