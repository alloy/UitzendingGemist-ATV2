//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class NSArray;

@interface BRProviderGroup : NSObject
{
    NSArray *_providers;
}

+ (id)groupWithProviders:(id)arg1;
- (id)createControlAtGroupIndex:(long)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (id)createControlsInGroupRange:(struct _NSRange)arg1 requestedBy:(id)arg2;
- (long)dataCount;
- (id)dataForGroupIndex:(long)arg1;
- (void)dealloc;
- (long)groupIndexForHash:(id)arg1;
- (id)hashForDataAtGroupIndex:(long)arg1;
- (id)initWithProviders:(id)arg1;
- (id)providerForDataAtGroupIndex:(long)arg1 providerIndex:(long *)arg2;
- (id)providers;

@end

