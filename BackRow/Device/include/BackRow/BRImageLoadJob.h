//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class NSDate, NSDictionary, NSString, NSURL, NSURLConnection;
@protocol BRMusicStoreImageDecryptionAgent;

__attribute__((visibility("hidden")))
@interface BRImageLoadJob : NSObject
{
    NSString *_imageName;
    NSURL *_url;
    NSDictionary *_headerFields;
    NSURLConnection *_connection;
    NSDate *_requestDate;
    BOOL _writeImage;
    id <BRMusicStoreImageDecryptionAgent> _decryptionAgent;
}

- (id)connection;
- (void)dealloc;
- (id)decryptionAgent;
- (id)headerFields;
- (id)initWithName:(id)arg1 url:(id)arg2 headerFields:(id)arg3 decryptionAgent:(id)arg4 writeImage:(BOOL)arg5;
- (id)name;
- (id)requestDate;
- (void)setConnection:(id)arg1;
- (id)url;
- (BOOL)writeImage;

@end

