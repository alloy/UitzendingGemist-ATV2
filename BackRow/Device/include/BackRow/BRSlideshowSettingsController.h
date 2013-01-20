/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/BackRow.framework/BackRow
 */

#import "BackRow-Structs.h"
#import "BRViewController.h"

@class BRMarimbaMenuView, NSArray, NSMutableArray, NSTimer;

@interface BRSlideshowSettingsController : BRViewController {
@private
	BRMarimbaMenuView *_marimbaMenuView;	// 60 = 0x3c
	NSMutableArray *_menuHistory;	// 64 = 0x40
	NSArray *_musicServers;	// 68 = 0x44
	NSArray *_musicPlaylists;	// 72 = 0x48
	ATVDataServerRef _defaultMusicServer;	// 76 = 0x4c
	ATVMediaQueryRef _playlistsQuery;	// 80 = 0x50
	NSTimer *_randomThemeSwappingTimer;	// 84 = 0x54
	int _currentMenuType;	// 88 = 0x58
	int _previousSelectionIndex;	// 92 = 0x5c
	BOOL _ignoreFocusMessages;	// 96 = 0x60
	BOOL _initialMenuSwitchInProgress;	// 97 = 0x61
	BOOL _playlistQueryInProgress;	// 98 = 0x62
	BOOL _updateDefaultMusicMenuAfterPlaylistQueryCompletes;	// 99 = 0x63
	BOOL _memoryWarningAlreadyReceived;	// 100 = 0x64
}
+ (id)randomTransitionIDs;	// 0x3167c801
+ (id)randomlySelectedSlideshowThemeIdentifier;	// 0x3167ca0d
+ (id)slideshowIdentifierForTitle:(id)title;	// 0x3167ca51
+ (id)slideshowThemeTitles;	// 0x3167cabd
- (id)init;	// 0x3167c7e9
- (id)initWithMediaCollection:(id)mediaCollection;	// 0x3167cc31
- (id)_allSharedComputers;	// 0x3167b9fd
- (id)_currentPlaylistName;	// 0x3167db69
- (ATVDataClientRef)_dataClient;	// 0x3167e6d5
- (int)_indexOfStringItem:(id)stringItem inArray:(id *)array itemCount:(int)count;	// 0x3167c599
- (void)_initiatePlaylistsQuery;	// 0x3167e499
- (void)_lowMemoryNotification:(id)notification;	// 0x3167bff5
- (void)_mainSettingsMenuList:(id)list didFocusItemAtIndexPath:(id)indexPath;	// 0x3167bb39
- (void)_mainSettingsMenuList:(id)list didSelectItemAtIndexPath:(id)indexPath;	// 0x3167d0c1
- (id)_mainSettingsMenuList:(id)list menuItemForRowAtIndexPath:(id)indexPath;	// 0x3167bc6d
- (long)_mainSettingsMenuList:(id)list numberOfRowsInSection:(long)section;	// 0x3167b8c9
- (id)_mainSettingsMenuList:(id)list sectionHeaderForSection:(long)section;	// 0x3167e041
- (long)_mainSettingsMenuNumberOfSectionsInList:(id)list;	// 0x3167b8c5
- (void)_musicLibraryMenuList:(id)list didFocusItemAtIndexPath:(id)indexPath;	// 0x3167b8e9
- (void)_musicLibraryMenuList:(id)list didSelectItemAtIndexPath:(id)indexPath;	// 0x3167e225
- (id)_musicLibraryMenuList:(id)list menuItemForRowAtIndexPath:(id)indexPath;	// 0x3167e08d
- (long)_musicLibraryMenuList:(id)list numberOfRowsInSection:(long)section;	// 0x3167ba4d
- (id)_musicLibraryMenuList:(id)list sectionHeaderForSection:(long)section;	// 0x3167dce9
- (long)_musicLibraryMenuNumberOfSectionsInList:(id)list;	// 0x3167b8e5
- (void)_musicServerConnectionNotification:(id)notification;	// 0x3167b941
- (void)_playlistMenuList:(id)list didFocusItemAtIndexPath:(id)indexPath;	// 0x3167b8ed
- (void)_playlistMenuList:(id)list didSelectItemAtIndexPath:(id)indexPath;	// 0x3167d451
- (id)_playlistMenuList:(id)list menuItemForRowAtIndexPath:(id)indexPath;	// 0x3167d9dd
- (long)_playlistMenuList:(id)list numberOfRowsInSection:(long)section;	// 0x3167b991
- (id)_playlistMenuList:(id)list sectionHeaderForSection:(long)section;	// 0x3167dc9d
- (long)_playlistMenuNumberOfSectionsInList:(id)list;	// 0x3167b9c1
- (void)_playlistsQueryComplete;	// 0x3167e715
- (void)_returnToPreviousMenu;	// 0x3167c0b9
- (void)_runPlaylistsQuery;	// 0x3167e5c1
- (void)_setPlaylistsQuery:(ATVMediaQueryRef)query;	// 0x3167e1ed
- (void)_swapSlideshowTheme:(id)theme;	// 0x3167baf5
- (void)_switchToMenuType:(int)menuType rememberCurrentMenu:(BOOL)menu;	// 0x3167c331
- (void)_themeDetailsMenuList:(id)list didFocusItemAtIndexPath:(id)indexPath;	// 0x3167ba7d
- (void)_themeDetailsMenuList:(id)list didSelectItemAtIndexPath:(id)indexPath;	// 0x3167cee9
- (id)_themeDetailsMenuList:(id)list menuItemForRowAtIndexPath:(id)indexPath;	// 0x3167deb9
- (long)_themeDetailsMenuList:(id)list numberOfRowsInSection:(long)section;	// 0x3167b8d9
- (id)_themeDetailsMenuList:(id)list sectionHeaderForSection:(long)section;	// 0x3167de6d
- (long)_themeDetailsMenuNumberOfSectionsInList:(id)list;	// 0x3167b8d5
- (void)_toggleTimePerSlide;	// 0x3167dd35
- (void)_updateListFocusOnMenuSwitch;	// 0x3167d679
- (BOOL)brEventAction:(id)action;	// 0x3167cb4d
- (void)dealloc;	// 0x3167ce05
- (void)list:(id)list didFocusItemAtIndexPath:(id)indexPath;	// 0x3167c629
- (void)list:(id)list didSelectItemAtIndexPath:(id)indexPath;	// 0x3167c5dd
- (float)list:(id)list heightForItemAtIndexPath:(id)indexPath;	// 0x3167b8bd
- (float)list:(id)list heightForSectionHeader:(long)sectionHeader;	// 0x3167c675
- (id)list:(id)list menuItemForRowAtIndexPath:(id)indexPath;	// 0x3167c799
- (long)list:(id)list numberOfRowsInSection:(long)section;	// 0x3167c6f9
- (id)list:(id)list sectionHeaderForSection:(long)section;	// 0x3167c6a9
- (long)numberOfSectionsInList:(id)list;	// 0x3167c749
@end
