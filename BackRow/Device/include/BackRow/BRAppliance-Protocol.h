//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

@class BRApplianceInfo;

@protocol BRAppliance <NSObject>
- (id)applianceCategories;
- (id)applianceController;
@property(readonly) BRApplianceInfo *applianceInfo;
- (id)controllerForIdentifier:(id)arg1 args:(id)arg2;
- (BOOL)handleObjectSelection:(id)arg1 userInfo:(id)arg2;
- (BOOL)handlePlay:(id)arg1 userInfo:(id)arg2;
- (id)identifierForContentAlias:(id)arg1;
- (id)initWithApplianceInfo:(id)arg1;
- (id)topShelfController;
@end
