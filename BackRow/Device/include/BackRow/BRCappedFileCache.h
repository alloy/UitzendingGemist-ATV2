/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import <NSObject.h> // Unknown library

@class NSString, NSMutableDictionary;

@interface BRCappedFileCache : NSObject {
@private
	unsigned long long _maxSize;	// 4 = 0x4
	unsigned long long _currentSize;	// 12 = 0xc
	unsigned long long _purgeThreshold;	// 20 = 0x14
	unsigned long _purgeCount;	// 28 = 0x1c
	NSString *_cachePath;	// 32 = 0x20
	BOOL _purgingCache;	// 36 = 0x24
	NSMutableDictionary *_files;	// 40 = 0x28
}
@property(readonly, assign) unsigned long long currentSize;	// G=0x36759061; converted property
@property(readonly, assign) unsigned long long maxSize;	// G=0x36759079; converted property
@property(assign) unsigned long purgeCount;	// G=0x367590f9; S=0x36759109; converted property
@property(assign) unsigned long long purgeThreshold;	// G=0x36759091; S=0x367590a9; converted property
- (id)initForPath:(id)path withMaxSize:(unsigned long long)maxSize;	// 0x36758e05
- (void)_clearCacheFolder;	// 0x36759a61
- (id)_generateCacheFilePathForKey:(id)key extension:(id)extension;	// 0x367598a1
- (void)_incrementCacheSize:(unsigned long long)size;	// 0x36759971
- (void)_maintainCacheSize:(id)size;	// 0x36759aed
- (void)_terminateNotification:(id)notification;	// 0x36759e05
- (id)addFileForKey:(id)key size:(unsigned long long)size extension:(id)extension;	// 0x36759329
// converted property getter: - (unsigned long long)currentSize;	// 0x36759061
- (void)dealloc;	// 0x36758fc1
- (id)filePathForKey:(id)key;	// 0x36759119
// converted property getter: - (unsigned long long)maxSize;	// 0x36759079
// converted property getter: - (unsigned long)purgeCount;	// 0x367590f9
// converted property getter: - (unsigned long long)purgeThreshold;	// 0x36759091
- (void)removedFileWithKey:(id)key;	// 0x3675966d
// converted property setter: - (void)setPurgeCount:(unsigned long)count;	// 0x36759109
// converted property setter: - (void)setPurgeThreshold:(unsigned long long)threshold;	// 0x367590a9
@end

