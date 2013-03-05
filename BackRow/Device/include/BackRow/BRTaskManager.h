/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRSingleton.h"

@class NSConditionLock, NSMutableArray;

__attribute__((visibility("hidden")))
@interface BRTaskManager : BRSingleton {
@private
	NSMutableArray *_taskQueue;	// 4 = 0x4
	NSConditionLock *_queueLock;	// 8 = 0x8
	int _numberOfTaskThreadsRunning;	// 12 = 0xc
	int _numberOfFinishingThreads;	// 16 = 0x10
}
+ (void)setSingleton:(id)singleton;	// 0x36756691
+ (id)singleton;	// 0x36756681
- (id)init;	// 0x367566a1
- (void)_processTasks;	// 0x36756a95
- (void)cancelTask:(id)task;	// 0x36756929
- (void)dealloc;	// 0x36756755
- (void)scheduleTask:(id)task;	// 0x367567b5
@end

