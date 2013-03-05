/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import <NSObject.h> // Unknown library

@class NSArray, NSPredicate, NSSet, NSString;

@interface BRDataStore : NSObject {
@private
	NSString *_entityName;	// 4 = 0x4
	NSPredicate *_predicate;	// 8 = 0x8
	NSPredicate *_predicateForMatching;	// 12 = 0xc
	NSPredicate *_predicateForIncompleteObject;	// 16 = 0x10
	NSSet *_mediaTypes;	// 20 = 0x14
	NSArray *_descriptors;	// 24 = 0x18
	NSArray *_data;	// 28 = 0x1c
	BOOL _localProvidersOnly;	// 32 = 0x20
	BOOL _useAnyMatchingMediaType;	// 33 = 0x21
	BOOL _isAssetStore;	// 34 = 0x22
	BOOL _needsUpdate;	// 35 = 0x23
	BOOL _includeHidden;	// 36 = 0x24
}
@property(readonly, retain) NSArray *data;	// G=0x3673453d; converted property
@property(readonly, retain) NSSet *mediaTypes;	// G=0x367343a5; converted property
@property(assign) BOOL useLocalProvidersOnly;	// G=0x36734691; S=0x36734681; converted property
+ (id)aggregateDataStoreWithDataStores:(id)dataStores;	// 0x36734059
- (id)initWithEntityName:(id)entityName predicate:(id)predicate mediaTypes:(id)types;	// 0x367340a1
- (id)initWithEntityName:(id)entityName predicate:(id)predicate withAnyOfMediaTypesIn:(id)anIn;	// 0x3673415d
- (id)_dataFromAllMatchingProviders;	// 0x36734db9
- (id)_dataFromFirstMatchingProvider;	// 0x36734cf1
- (id)_predicateForMatching;	// 0x367346a1
- (void)addObject:(id)object;	// 0x367347b1
- (void)checkIncompleteObject:(id)object;	// 0x36734771
- (long)count;	// 0x36734659
// converted property getter: - (id)data;	// 0x3673453d
- (void)dealloc;	// 0x36734199
- (void)hostAvailabilityChanged;	// 0x367349e1
- (long)indexOfObject:(id)object;	// 0x367349b1
- (id)loadData;	// 0x36734445
// converted property getter: - (id)mediaTypes;	// 0x367343a5
- (void)objectModified:(id)modified;	// 0x3673489d
- (void)purge;	// 0x36734479
- (void)removeObject:(id)object;	// 0x36734901
- (void)setIncludeHidden:(BOOL)hidden;	// 0x36734435
- (void)setNeedsUpdate;	// 0x367349f1
- (void)setPredicateForIncompleteObject:(id)incompleteObject;	// 0x367343f5
- (void)setPredicateForMatching:(id)matching;	// 0x367343b5
- (void)setSortDescriptors:(id)descriptors;	// 0x3673425d
// converted property setter: - (void)setUseLocalProvidersOnly:(BOOL)only;	// 0x36734681
- (BOOL)storeAppliesToObject:(id)object;	// 0x367346c5
- (BOOL)updateDataIfNeeded;	// 0x36734a05
// converted property getter: - (BOOL)useLocalProvidersOnly;	// 0x36734691
@end

