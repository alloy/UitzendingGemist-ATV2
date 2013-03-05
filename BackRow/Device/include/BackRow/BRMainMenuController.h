/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import "BRController.h"

@class NSMutableArray, BRMainMenuControl, BRBackgroundTask, NSArray;
@protocol BRAppliance;

@interface BRMainMenuController : BRController {
@private
	NSArray *_applianceInfos;	// 84 = 0x54
	NSMutableArray *_topShelfControllers;	// 88 = 0x58
	BRMainMenuControl *_browser;	// 92 = 0x5c
	BOOL _enabled;	// 96 = 0x60
	BOOL _handlingMainMenuEvent;	// 97 = 0x61
	BRBackgroundTask *_topShelfRefreshTask;	// 100 = 0x64
}
@property(readonly, assign) id<BRAppliance> currentAppliance;	// G=0x3665e59d; 
+ (BOOL)handlingMainMenuEvent;	// 0x3665e0fd
+ (void)highlightApplianceWithKey:(id)key andCategoryWithIdentifier:(id)identifier;	// 0x3665e06d
+ (void)setHandlingMainMenuEvent:(BOOL)event;	// 0x3665e179
- (id)init;	// 0x3665e1fd
- (BOOL)_browserItemSelected:(id)selected;	// 0x3665ec11
- (void)_handleWindowMaxBoundsChanged;	// 0x3665e991
- (BOOL)_handlingMainMenuEvent;	// 0x3665ecf5
- (void)_highlightApplianceWithKey:(id)key andCategoryWithIdentifier:(id)identifier;	// 0x3665ebf1
- (void)_loadAppliances;	// 0x3665ea8d
- (void)_reloadTopShelvesByRecreating:(BOOL)recreating;	// 0x3665ed99
- (void)_setHandlingMainMenuEvent:(BOOL)event;	// 0x3665ed05
- (void)_shelfNoLongerFocusable:(id)focusable;	// 0x3665ed15
- (void)_topShelfControllerWillBeHidden:(id)_topShelfController;	// 0x3665f019
- (void)_topShelfControllerWillBeShown:(id)_topShelfController;	// 0x3665efe1
- (id)accessibilityLabel;	// 0x3665e5bd
- (BOOL)canBeRemovedFromStack;	// 0x3665e411
- (void)clearRemembery;	// 0x3665e57d
- (void)controlWasActivated;	// 0x3665e84d
- (void)controlWasDeactivated;	// 0x3665e90d
// declared property getter: - (id)currentAppliance;	// 0x3665e59d
- (void)dealloc;	// 0x3665e339
- (void)enable;	// 0x3665e415
- (void)mainMenu:(id)menu didSelectCategoryAtIndexPath:(id)indexPath;	// 0x3665e665
- (id)mainMenu:(id)menu shelfForApplianceAtIndex:(unsigned)index;	// 0x3665e5e5
- (void)mainMenu:(id)menu willHideShelfAtApplianceIndex:(long)applianceIndex;	// 0x3665e7cd
- (void)mainMenu:(id)menu willShowShelfAtApplianceIndex:(long)applianceIndex;	// 0x3665e80d
- (void)reloadMainMenu;	// 0x3665e429
@end

