/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRSingleton.h"

@protocol BRRatingInfoDatabase;

@interface BRParentalControlManager : BRSingleton {
@private
	id<BRRatingInfoDatabase> _ratingInfoDatabase;	// 4 = 0x4
}
@property(assign) BOOL accessControlEnabled;	// G=0x3672ba51; S=0x3672b995; converted property
@property(assign) int accessModeForPurchase;	// G=0x3672c97d; S=0x3672c8b5; converted property
@property(retain) id defaultRatingSystemID;	// G=0x3672bbd9; S=0x3672bb91; converted property
@property(retain) id pin;	// G=0x3672bb4d; S=0x3672ba91; converted property
@property(retain) id ratingDatabase;	// G=0x3672bc5d; S=0x3672bc1d; converted property
+ (void)setSingleton:(id)singleton;	// 0x3672b959
+ (id)singleton;	// 0x3672b949
+ (BOOL)storeAccessRestricted;	// 0x3672ccad
- (id)init;	// 0x3672b969
- (int)_accessModeForAppliance:(id)appliance categoryIdentifier:(id)identifier isSet:(BOOL *)set;	// 0x3672c1b5
- (void)_delayedNotifyApplianceAccessChanged;	// 0x3672c171
// converted property getter: - (BOOL)accessControlEnabled;	// 0x3672ba51
- (int)accessModeForAppliance:(id)appliance categoryIdentifier:(id)identifier;	// 0x3672c3d9
- (int)accessModeForMediaType:(id)mediaType withRatingSystemID:(id)ratingSystemID withRank:(id)rank;	// 0x3672c6a9
// converted property getter: - (int)accessModeForPurchase;	// 0x3672c97d
- (void)clearAccessModeforAppliance:(id)appliance categoryIdentifier:(id)identifier;	// 0x3672bc6d
- (int)computeAccessModeForAppliance:(id)appliance withCategoryIdentifier:(id)categoryIdentifier;	// 0x3672ce99
- (int)computeAccessModeForAsset:(id)asset;	// 0x3672cd05
- (int)computeAccessModeForPurchase;	// 0x3672cde9
- (int)computeAccessModeForPurchaseWithMediaType:(id)mediaType withRatingSystemID:(id)ratingSystemID withRank:(id)rank isExplicit:(BOOL)anExplicit;	// 0x3672ce21
// converted property getter: - (id)defaultRatingSystemID;	// 0x3672bbd9
- (int)explicitAccessModeForMediaType:(id)mediaType;	// 0x3672cb75
- (BOOL)hasAccessModeBeenSetForAppliance:(id)appliance categoryIdentifier:(id)identifier;	// 0x3672c3ad
// converted property getter: - (id)pin;	// 0x3672bb4d
// converted property getter: - (id)ratingDatabase;	// 0x3672bc5d
// converted property setter: - (void)setAccessControlEnabled:(BOOL)enabled;	// 0x3672b995
- (void)setAccessMode:(int)mode forAppliance:(id)appliance categoryIdentifier:(id)identifier;	// 0x3672be65
- (void)setAccessMode:(int)mode forMediaType:(id)mediaType withRatingSystemID:(id)ratingSystemID withThresholdRank:(id)thresholdRank;	// 0x3672c3fd
// converted property setter: - (void)setAccessModeForPurchase:(int)purchase;	// 0x3672c8b5
// converted property setter: - (void)setDefaultRatingSystemID:(id)anId;	// 0x3672bb91
- (void)setExplicitAccessMode:(int)mode forMediaType:(id)mediaType;	// 0x3672c9d1
// converted property setter: - (void)setPin:(id)pin;	// 0x3672ba91
// converted property setter: - (void)setRatingDatabase:(id)database;	// 0x3672bc1d
- (id)thresholdForMediaType:(id)mediaType withRatingSystemID:(id)ratingSystemID;	// 0x3672ced9
@end

