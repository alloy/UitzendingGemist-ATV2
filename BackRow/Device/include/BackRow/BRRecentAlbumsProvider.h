/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRProvider.h"
#import <NSObject.h> // Unknown library

@class NSArray, NSSet;
@protocol BRControlFactory;

@interface BRRecentAlbumsProvider : NSObject <BRProvider> {
@private
	long _maxCount;	// 4 = 0x4
	long _dataCount;	// 8 = 0x8
	id<BRControlFactory> _controlFactory;	// 12 = 0xc
	NSArray *_data;	// 16 = 0x10
	NSSet *_musicTypes;	// 20 = 0x14
	BOOL _invalidateOnValidityCheck;	// 24 = 0x18
}
@property(readonly, assign) long dataCount;	// G=0x36717bfd; converted property
- (id)initWithControlFactory:(id)controlFactory maxCount:(long)count;	// 0x367178d9
- (void)_databaseMessagesSuppressed:(id)suppressed;	// 0x36717fa5
- (void)_databaseObjectWasAdded:(id)added;	// 0x36717fb9
- (void)_databaseObjectWasModified:(id)modified;	// 0x367181a5
- (void)_databaseObjectWillBeDeleted:(id)_databaseObject;	// 0x367180f9
- (void)_downloadConvertedToAsset:(id)asset;	// 0x367182fd
- (void)_hostAvailabilityChanged:(id)changed;	// 0x36718249
- (long)_primeData;	// 0x36717cd9
- (void)_updateDataIfNeeded:(id)needed;	// 0x3671826d
- (id)controlFactory;	// 0x36717bed
- (id)dataAtIndex:(long)index;	// 0x36717c35
// converted property getter: - (long)dataCount;	// 0x36717bfd
- (void)dealloc;	// 0x36717b49
- (id)hashForDataAtIndex:(long)index;	// 0x36717c85
@end

