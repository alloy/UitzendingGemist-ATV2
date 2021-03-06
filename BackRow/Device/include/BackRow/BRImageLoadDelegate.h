//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class BRImageLoadJob, BRImageManager, NSMutableData;

__attribute__((visibility("hidden")))
@interface BRImageLoadDelegate : NSObject
{
    BRImageManager *_manager;
    BRImageLoadJob *_job;
    NSMutableData *_data;
}

+ (id)imageLoadDelegateForManager:(id)arg1 withJob:(id)arg2;
- (void)connection:(id)arg1 didFailWithError:(id)arg2;
- (void)connection:(id)arg1 didReceiveData:(id)arg2;
- (void)connection:(id)arg1 didReceiveResponse:(id)arg2;
- (id)connection:(id)arg1 willCacheResponse:(id)arg2;
- (id)connection:(id)arg1 willSendRequest:(id)arg2 redirectResponse:(id)arg3;
- (void)connectionDidFinishLoading:(id)arg1;
- (id)content;
- (void)dealloc;
- (id)initForManager:(id)arg1 withJob:(id)arg2;
- (id)job;

@end

