//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

@class NSArray, NSMutableDictionary;

@interface BRApplianceManager : BRSingleton
{
    NSArray *_arrangedAppliances;
    BOOL _loadingAppliances;
    NSArray *_appliances;
    NSMutableDictionary *_applianceIdentifierToApplianceDictionary;
}

+ (void)setSingleton:(id)arg1;
+ (void)showMainMenu;
+ (id)singleton;
- (void)_applianceDidReloadCategories:(id)arg1;
- (id)_applianceForInfo:(id)arg1;
- (id)_controllerForApplianceKey:(id)arg1 identifier:(id)arg2 args:(id)arg3;
- (void)_handleLanguageChangedNotification:(id)arg1;
- (void)_handleParentalControlsChangedNotification:(id)arg1;
- (BOOL)_handlePlay:(id)arg1 userInfo:(id)arg2;
- (void)_invalidateArrangedAppliances;
- (id)_loadApplianceAtPath:(id)arg1;
- (void)_loadAppliances;
- (BOOL)_shouldLoadApp:(id)arg1;
- (id)applianceForInfo:(id)arg1;
@property(retain) NSMutableDictionary *applianceIdentifierToApplianceDictionary; // @synthesize applianceIdentifierToApplianceDictionary=_applianceIdentifierToApplianceDictionary;
- (id)applianceInfoForApplianceIdentifier:(id)arg1;
- (id)applianceInfoList;
@property(copy) NSArray *appliances; // @synthesize appliances=_appliances;
@property(readonly) NSArray *arrangedAppliances;
- (id)controllerForApplianceInfo:(id)arg1 identifier:(id)arg2 args:(id)arg3;
- (id)controllerForApplianceKey:(id)arg1 identifier:(id)arg2 args:(id)arg3;
- (id)controllerForMerchant:(id)arg1;
- (void)dealloc;
- (BOOL)handleObjectSelection:(id)arg1 userInfo:(id)arg2;
- (BOOL)handlePlay:(id)arg1 userInfo:(id)arg2;
- (id)init;
- (void)loadAppliances;

@end

