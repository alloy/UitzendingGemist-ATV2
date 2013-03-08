//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

#import "BRITunesUtilities-Protocol.h"

@interface BRITunesLibraryUtilitiesAccess : BRSingleton <BRITunesUtilities>
{
    id <BRITunesUtilities> _utilitiesDelegate;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (BOOL)attemptAuthorizationForAsset:(id)arg1 error:(id *)arg2;
- (void)dealloc;
- (void)deauthorizeAssetIfNecessary:(id)arg1;
- (void)deleteImportedKeybagData;
- (id)iTunesCompareAscending:(BOOL)arg1 withKey:(id)arg2;
- (id)iTunesCompareAscending:(BOOL)arg1 withKey:(id)arg2 fallbackSortSelector:(SEL)arg3;
- (int)iTunesCompareString:(id)arg1 toString:(id)arg2;
- (void)importKeybagData:(id)arg1 forDSID:(id)arg2;
- (id)keyBagPathForMachineID:(unsigned long long)arg1;
- (unsigned long)randomPlaylistIndex:(unsigned long)arg1;
- (id)rentalGUID;
- (void)setITunesUtilitiesDelegate:(id)arg1;
- (id)sortStringForString:(id)arg1;
- (id)urlSuitableForPlayback:(id)arg1;

@end

