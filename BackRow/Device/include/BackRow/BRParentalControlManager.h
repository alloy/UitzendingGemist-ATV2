//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

@protocol BRRatingInfoDatabase;

@interface BRParentalControlManager : BRSingleton
{
    id <BRRatingInfoDatabase> _ratingInfoDatabase;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
+ (BOOL)storeAccessRestricted;
- (int)_accessModeForAppliance:(id)arg1 categoryIdentifier:(id)arg2 isSet:(char *)arg3;
- (void)_delayedNotifyApplianceAccessChanged;
- (BOOL)accessControlEnabled;
- (int)accessModeForAppliance:(id)arg1 categoryIdentifier:(id)arg2;
- (int)accessModeForMediaType:(id)arg1 withRatingSystemID:(id)arg2 withRank:(id)arg3;
- (int)accessModeForPurchase;
- (void)clearAccessModeforAppliance:(id)arg1 categoryIdentifier:(id)arg2;
- (int)computeAccessModeForAppliance:(id)arg1 withCategoryIdentifier:(id)arg2;
- (int)computeAccessModeForAsset:(id)arg1;
- (int)computeAccessModeForPurchase;
- (int)computeAccessModeForPurchaseWithMediaType:(id)arg1 withRatingSystemID:(id)arg2 withRank:(id)arg3 isExplicit:(BOOL)arg4;
- (id)defaultRatingSystemID;
- (int)explicitAccessModeForMediaType:(id)arg1;
- (BOOL)hasAccessModeBeenSetForAppliance:(id)arg1 categoryIdentifier:(id)arg2;
- (id)init;
- (id)pin;
- (id)ratingDatabase;
- (void)setAccessControlEnabled:(BOOL)arg1;
- (void)setAccessMode:(int)arg1 forAppliance:(id)arg2 categoryIdentifier:(id)arg3;
- (void)setAccessMode:(int)arg1 forMediaType:(id)arg2 withRatingSystemID:(id)arg3 withThresholdRank:(id)arg4;
- (void)setAccessModeForPurchase:(int)arg1;
- (void)setDefaultRatingSystemID:(id)arg1;
- (void)setExplicitAccessMode:(int)arg1 forMediaType:(id)arg2;
- (void)setPin:(id)arg1;
- (void)setRatingDatabase:(id)arg1;
- (id)thresholdForMediaType:(id)arg1 withRatingSystemID:(id)arg2;

@end

