/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRSingleton.h"


@interface BRFileManager : BRSingleton {
}
+ (void)setSingleton:(id)singleton;	// 0x3675e0d1
+ (id)singleton;	// 0x3675e0c1
- (id)attributesOfItemAtPath:(id)path error:(id *)error;	// 0x3675e435
- (id)cachePath;	// 0x3675e5b9
- (id)contentsOfDirectoryAtPath:(id)path error:(id *)error;	// 0x3675e161
- (BOOL)copyItemAtPath:(id)path toPath:(id)path2 error:(id *)error;	// 0x3675e4e5
- (BOOL)createDirectoryAtPath:(id)path attributes:(id)attributes error:(id *)error;	// 0x3675e0e1
- (BOOL)fileExistsAtPath:(id)path;	// 0x3675e471
- (BOOL)fileExistsAtPath:(id)path isDirectory:(BOOL *)directory;	// 0x3675e4a9
- (id)modDateOfFileAtPath:(id)path error:(id *)error;	// 0x3675e56d
- (id)mostRecentModDateInDirectoryAtPath:(id)path error:(id *)error;	// 0x3675e2dd
- (BOOL)moveItemAtPath:(id)path toPath:(id)path2 error:(id *)error;	// 0x3675e529
- (unsigned long long)onDiskFileSizeOfFileAtPath:(id)path status:(int *)status;	// 0x3675e671
- (BOOL)removeContentsOfDirectoryAtPath:(id)path error:(id *)error;	// 0x3675e19d
- (BOOL)removeItemAtPath:(id)path error:(id *)error;	// 0x3675e125
- (id)videoCachePath;	// 0x3675e63d
@end

