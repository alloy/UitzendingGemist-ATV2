/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "AppleTV-Structs.h"
#import <NSObject.h> // Unknown library

@class NSLock, NSMutableArray;

__attribute__((visibility("hidden")))
@interface BRThreadCallback : NSObject {
@private
	CFRunLoopRef _loop;	// 4 = 0x4
	CFRunLoopSourceRef _source;	// 8 = 0x8
	NSMutableArray *_notifications;	// 12 = 0xc
	NSLock *_lock;	// 16 = 0x10
}
- (id)init;	// 0x36773c5d
- (void)dealloc;	// 0x36774065
@end

