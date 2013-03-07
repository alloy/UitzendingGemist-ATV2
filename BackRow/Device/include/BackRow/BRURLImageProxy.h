//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRImageProxy-Protocol.h"

@class BRImage, BRMediaType, NSDictionary, NSString, NSURL;

@interface BRURLImageProxy : NSObject <BRImageProxy>
{
    NSString *_imageID;
    NSURL *_url;
    NSDictionary *_headerFields;
    id <BRMusicStoreImageDecryptionAgent> _decryptionAgent;
    BRMediaType *_mediaTypeForDefaultImage;
    BRImage *_defaultImage;
    BOOL _writeToDisk;
}

+ (id)proxyWithURL:(id)arg1;
+ (id)proxyWithURL:(id)arg1 decryptionAgent:(id)arg2;
+ (id)proxyWithURL:(id)arg1 headerFields:(id)arg2;
+ (id)proxyWithURL:(id)arg1 headerFields:(id)arg2 decryptionAgent:(id)arg3;
- (void)cancelImageRequestsForImageSizes:(int)arg1;
- (void)dealloc;
- (id)decryptionAgent;
- (id)defaultImage;
- (id)defaultImageForImageSize:(int)arg1;
- (id)headerFields;
- (id)imageForImageSize:(int)arg1;
- (id)imageIDForImageSize:(int)arg1;
- (id)initWithURL:(id)arg1;
- (id)initWithURL:(id)arg1 decryptionAgent:(id)arg2;
- (id)initWithURL:(id)arg1 headerFields:(id)arg2;
- (id)initWithURL:(id)arg1 headerFields:(id)arg2 decryptionAgent:(id)arg3;
- (id)mediaTypeForDefaultImage;
- (id)object;
- (void)setDecryptionAgent:(id)arg1;
- (void)setDefaultImage:(id)arg1;
- (void)setHeaderFields:(id)arg1;
- (void)setMediaTypeForDefaultImage:(id)arg1;
- (void)setObject:(id)arg1;
- (void)setWriteToDisk:(BOOL)arg1;
- (BOOL)supportsImageForImageSize:(int)arg1;
- (id)url;
- (BOOL)writeToDisk;

@end

