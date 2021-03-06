//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class ATVVendorBag, NSDictionary, NSString, NSURL;

@interface BRMerchantInfo : NSObject
{
    ATVVendorBag *_vendorBag;
    BOOL _enabled;
    NSString *_featureName;
    NSDictionary *metadata;
    NSDictionary *feedResources;
}

+ (id)infoWithVendorBag:(id)arg1;
- (id)_featureCode;
@property(readonly, nonatomic) NSDictionary *appDictionary;
@property(readonly, nonatomic) NSString *authType;
@property(readonly, nonatomic) NSString *bootstrapResourceURL;
@property(readonly, nonatomic) NSString *bootstrapResourceVersion;
- (void)dealloc;
@property(readonly, nonatomic) int defaultParentalControlsAccessMode;
@property BOOL enabled;
@property(readonly, nonatomic) BOOL enabledInBag;
@property(retain) NSString *featureName;
@property(nonatomic) NSDictionary *feedResources; // @synthesize feedResources;
@property(readonly, nonatomic) BOOL hasBeenRemoved;
- (id)initWithVendorBag:(id)arg1;
@property(readonly, nonatomic) NSString *javascriptURL;
@property(readonly, nonatomic) NSString *maximumVersion;
@property(readonly, nonatomic) NSURL *menuIconURL;
@property(readonly, nonatomic) NSString *menuIconURLVersion;
@property(readonly, nonatomic) NSString *menuTitle;
@property(readonly, nonatomic) NSString *merchantID;
@property(nonatomic) NSDictionary *metadata; // @synthesize metadata;
@property(readonly, nonatomic) NSString *minimumRequiredVersion;
@property(readonly, nonatomic) BOOL pinToMerchant;
@property(readonly, nonatomic) float preferredOrder;
@property(readonly, nonatomic) NSString *rootURL;
@property(readonly, nonatomic) NSString *supportURL;
@property(readonly, nonatomic) NSString *topShelfURL;
- (void)useDefaultEnablement;
@property(readonly, nonatomic) BOOL usesParentalControls;
- (id)valueForUndefinedKey:(id)arg1;

@end

