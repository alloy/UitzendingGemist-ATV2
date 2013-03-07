//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "BRProvider.h"

@class NSSet, NSString;

@interface BRNowPlayingProvider : NSObject <BRProvider>
{
    id <BRControlFactory> _factory;
    NSSet *_types;
    NSString *_playerMediaAssetID;
}

+ (id)providerForTypes:(id)arg1;
- (void)_checkPlayerState;
- (id)_initWithTypes:(id)arg1;
- (void)_playerStateChanged:(id)arg1;
- (id)controlFactory;
- (id)dataAtIndex:(long)arg1;
- (long)dataCount;
- (void)dealloc;
- (id)hashForDataAtIndex:(long)arg1;

@end

