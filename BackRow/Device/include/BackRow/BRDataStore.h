//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

@class NSArray, NSPredicate, NSSet, NSString;

@interface BRDataStore : NSObject
{
    NSString *_entityName;
    NSPredicate *_predicate;
    NSPredicate *_predicateForMatching;
    NSPredicate *_predicateForIncompleteObject;
    NSSet *_mediaTypes;
    NSArray *_descriptors;
    NSArray *_data;
    BOOL _localProvidersOnly;
    BOOL _useAnyMatchingMediaType;
    BOOL _isAssetStore;
    BOOL _needsUpdate;
    BOOL _includeHidden;
}

+ (id)aggregateDataStoreWithDataStores:(id)arg1;
- (id)_dataFromAllMatchingProviders;
- (id)_dataFromFirstMatchingProvider;
- (id)_predicateForMatching;
- (void)addObject:(id)arg1;
- (void)checkIncompleteObject:(id)arg1;
- (long)count;
- (id)data;
- (void)dealloc;
- (void)hostAvailabilityChanged;
- (long)indexOfObject:(id)arg1;
- (id)initWithEntityName:(id)arg1 predicate:(id)arg2 mediaTypes:(id)arg3;
- (id)initWithEntityName:(id)arg1 predicate:(id)arg2 withAnyOfMediaTypesIn:(id)arg3;
- (id)loadData;
- (id)mediaTypes;
- (void)objectModified:(id)arg1;
- (void)purge;
- (void)removeObject:(id)arg1;
- (void)setIncludeHidden:(BOOL)arg1;
- (void)setNeedsUpdate;
- (void)setPredicateForIncompleteObject:(id)arg1;
- (void)setPredicateForMatching:(id)arg1;
- (void)setSortDescriptors:(id)arg1;
- (void)setUseLocalProvidersOnly:(BOOL)arg1;
- (BOOL)storeAppliesToObject:(id)arg1;
- (BOOL)updateDataIfNeeded;
- (BOOL)useLocalProvidersOnly;

@end

