//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRAuthenticator.h>

@class NSString;

@interface BRUserPasswordAuthenticator : BRAuthenticator
{
    NSString *_user;
    NSString *_password;
}

- (void)_handleAuthenticationFailedWithError:(id)arg1;
- (void)_handleAuthenticationSucceeded;
- (void)dealloc;
- (id)initWithAccount:(id)arg1 scope:(unsigned int)arg2;
- (id)makeAuthenticationController;
@property(retain) NSString *password; // @synthesize password=_password;
- (BOOL)requiresPassword:(id *)arg1;
- (BOOL)requiresUser:(id *)arg1;
@property(retain) NSString *user; // @synthesize user=_user;

@end

