//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRAuthenticatorDelegate-Protocol.h"

@class BRAuthenticator;

@interface BRAuthenticationManager : NSObject <BRAuthenticatorDelegate>
{
    CDUnknownBlockType _authenticatorCreation;
    BRAuthenticator *_authenticator;
}

+ (id)managerForAccountType:(id)arg1;
+ (void)registerManager:(id)arg1 forAccountType:(id)arg2;
- (void)_authenticationControllerDidCancel:(id)arg1;
- (void)_checkAuthenticator:(id *)arg1 forAccount:(id)arg2 scope:(unsigned int)arg3;
- (id)_selectAccount;
- (id)_selectAuthenticatorWithAccount:(id)arg1 scope:(unsigned int)arg2;
- (void)autenticationSucceededForAuthenticator:(id)arg1 accountChanged:(BOOL)arg2;
- (id)authenticationControllerForScope:(unsigned int)arg1;
- (id)authenticator;
- (void)dealloc;
- (id)initWithAuthenticatorCreation:(CDUnknownBlockType)arg1;
- (id)preferredAccount;
- (void)reauthenticationFailedForAuthenticator:(id)arg1 error:(id)arg2;
- (void)setPreferredAccount:(id)arg1;

@end
