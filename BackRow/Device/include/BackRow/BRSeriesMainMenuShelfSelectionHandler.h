/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import <NSObject.h> // Unknown library
#import "BRSelectionHandler.h"

@class NSSet;

@interface BRSeriesMainMenuShelfSelectionHandler : NSObject <BRSelectionHandler> {
@private
	NSSet *_mediaTypes;	// 4 = 0x4
	BOOL _filterOutWatched;	// 8 = 0x8
}
+ (id)selectionHandlerForTypes:(id)types;	// 0x3671a7d5
- (id)_initWithTypes:(id)types filteringOutWatched:(BOOL)watched;	// 0x3671aa5d
- (void)dealloc;	// 0x3671a825
- (BOOL)handleSelectionForControl:(id)control;	// 0x3671a871
@end

