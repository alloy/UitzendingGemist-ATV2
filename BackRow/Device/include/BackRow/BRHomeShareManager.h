//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

@interface BRHomeShareManager : BRSingleton
{
    Class _homeShareHandlerClass;
    id <BRHomeShareHandler> _handlerInstance;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (void)disableHomeSharing;
- (void)enableHomeSharingWithAccountName:(id)arg1 andPassword:(id)arg2;
- (id)handler;
- (BOOL)hasHomeShareAccount;
- (id)homeShareAccount;
- (id)homeSharingGroupIDIsEnabled:(id *)arg1;
- (BOOL)isHomeSharingEnabled;
- (unsigned long long)machineIDForServer:(struct __ATVDataServer *)arg1;
- (long)pairForHomeShareStreamingWithHost:(struct __ATVDataServer *)arg1;
- (unsigned long long)pairingGUIDForServer:(struct __ATVDataServer *)arg1;
- (void)registerHandlerClass:(Class)arg1;

@end

