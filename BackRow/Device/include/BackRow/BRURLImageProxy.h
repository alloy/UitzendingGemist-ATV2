/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRImageProxy.h"
#import <NSObject.h> // Unknown library

@class NSURL, BRMediaType, BRImage, NSDictionary, NSString;
@protocol BRMusicStoreImageDecryptionAgent;

@interface BRURLImageProxy : NSObject <BRImageProxy> {
@private
	NSString *_imageID;	// 4 = 0x4
	NSURL *_url;	// 8 = 0x8
	NSDictionary *_headerFields;	// 12 = 0xc
	id<BRMusicStoreImageDecryptionAgent> _decryptionAgent;	// 16 = 0x10
	BRMediaType *_mediaTypeForDefaultImage;	// 20 = 0x14
	BRImage *_defaultImage;	// 24 = 0x18
	BOOL _writeToDisk;	// 28 = 0x1c
}
@property(retain) id decryptionAgent;	// G=0x3677ab21; S=0x3677ab31; converted property
@property(retain) BRImage *defaultImage;	// G=0x3677aaa1; S=0x3677aa61; converted property
@property(retain) NSDictionary *headerFields;	// G=0x3677aad1; S=0x3677aae1; converted property
@property(retain) BRMediaType *mediaTypeForDefaultImage;	// G=0x3677aa05; S=0x3677a9f5; converted property
@property(retain) id object;	// G=0x3677aabd; S=0x3677aab9; converted property
@property(readonly, retain) NSURL *url;	// G=0x3677aac1; converted property
@property(assign) BOOL writeToDisk;	// G=0x3677ab51; S=0x3677ab41; converted property
+ (id)proxyWithURL:(id)url;	// 0x3677a46d
+ (id)proxyWithURL:(id)url decryptionAgent:(id)agent;	// 0x3677a4b9
+ (id)proxyWithURL:(id)url headerFields:(id)fields;	// 0x3677a509
+ (id)proxyWithURL:(id)url headerFields:(id)fields decryptionAgent:(id)agent;	// 0x3677a559
- (id)initWithURL:(id)url;	// 0x3677a5b1
- (id)initWithURL:(id)url decryptionAgent:(id)agent;	// 0x3677a5d1
- (id)initWithURL:(id)url headerFields:(id)fields;	// 0x3677a5f1
- (id)initWithURL:(id)url headerFields:(id)fields decryptionAgent:(id)agent;	// 0x3677a615
- (void)cancelImageRequestsForImageSizes:(int)imageSizes;	// 0x3677aab5
- (void)dealloc;	// 0x3677a6b5
// converted property getter: - (id)decryptionAgent;	// 0x3677ab21
// converted property getter: - (id)defaultImage;	// 0x3677aaa1
- (id)defaultImageForImageSize:(int)imageSize;	// 0x3677aa15
// converted property getter: - (id)headerFields;	// 0x3677aad1
- (id)imageForImageSize:(int)imageSize;	// 0x3677a85d
- (id)imageIDForImageSize:(int)imageSize;	// 0x3677a73d
// converted property getter: - (id)mediaTypeForDefaultImage;	// 0x3677aa05
// converted property getter: - (id)object;	// 0x3677aabd
// converted property setter: - (void)setDecryptionAgent:(id)agent;	// 0x3677ab31
// converted property setter: - (void)setDefaultImage:(id)image;	// 0x3677aa61
// converted property setter: - (void)setHeaderFields:(id)fields;	// 0x3677aae1
// converted property setter: - (void)setMediaTypeForDefaultImage:(id)defaultImage;	// 0x3677a9f5
// converted property setter: - (void)setObject:(id)object;	// 0x3677aab9
// converted property setter: - (void)setWriteToDisk:(BOOL)disk;	// 0x3677ab41
- (BOOL)supportsImageForImageSize:(int)imageSize;	// 0x3677aab1
// converted property getter: - (id)url;	// 0x3677aac1
// converted property getter: - (BOOL)writeToDisk;	// 0x3677ab51
@end

