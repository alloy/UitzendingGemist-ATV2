//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRPhotoDataStoreProvider.h"

#import "BRPhotoProviderForCollection-Protocol.h"

@interface BRPhotoDataStoreProviderForCollection : BRPhotoDataStoreProvider <BRPhotoProviderForCollection>
{
}

+ (id)providerWithDataStore:(id)arg1 controlFactory:(id)arg2;
- (BOOL)canHaveZeroData;
- (id)collection;
- (void)setVendPhotoDataOnly:(BOOL)arg1;
- (BOOL)vendPhotoDataOnly;

@end

