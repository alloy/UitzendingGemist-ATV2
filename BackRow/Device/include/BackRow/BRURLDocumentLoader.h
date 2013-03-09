//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class BRURLDocumentManager;

__attribute__((visibility("hidden")))
@interface BRURLDocumentLoader : NSObject
{
    BRURLDocumentManager *_manager;
    unsigned int _numberOfLoadingDocument;
    CDUnknownBlockType _documentReadyHandler;
    CDUnknownBlockType _completionHandler;
}

+ (id)loaderWithManager:(id)arg1;
- (void)_documentReady:(id)arg1;
- (void)dealloc;
- (id)initWithManager:(id)arg1;
- (void)loadDocument:(id)arg1 completionHandler:(CDUnknownBlockType)arg2;
- (void)loadDocuments:(id)arg1 documentReadyHandler:(CDUnknownBlockType)arg2 completionHandler:(CDUnknownBlockType)arg3;

@end
