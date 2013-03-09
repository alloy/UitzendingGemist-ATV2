//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

@class NSArray, NSManagedObjectContext, NSManagedObjectModel, NSPersistentStoreCoordinator;

@interface BRTextEntryHistory : BRSingleton
{
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    NSArray *_clientIdentifiers;
    NSArray *_behaviorIdentifiers;
    NSArray *_behaviorsCache;
    NSArray *_historyItemStringsCache;
    BOOL _allClientsCached;
    BOOL _allBehaviorsCached;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (void)_addClient:(id)arg1 behaviors:(id)arg2 maxItemsPerBehavior:(id)arg3;
- (void)_addHistoryItem:(id)arg1 forClient:(id)arg2;
- (void)_deleteAllHistoryItemsForClient:(id)arg1;
- (void)_deleteAllTextEntryHistory;
- (void)_deleteHistoryItem:(id)arg1 forClient:(id)arg2;
- (void)_displayAllTextEntryHistory;
- (void)_performAction:(int)arg1 withHistoryItem:(id)arg2 forClients:(id)arg3 textEntryBehaviors:(id)arg4;
- (void)_refreshDataCacheForClients:(id)arg1 behaviors:(id)arg2;
- (void)_saveContext;
- (void)_validateCacheAgainstClientIdentifiers:(id)arg1 behaviorIdentifiers:(id)arg2;
- (void)dealloc;
- (void)deleteAllHistoryItemsForClients:(id)arg1;
- (void)deleteAllHistoryItemsForClients:(id)arg1 textEntryBehaviors:(id)arg2;
- (void)deleteHistoryItem:(id)arg1 forClients:(id)arg2 textEntryBehaviors:(id)arg3;
- (void)deleteTextEntryBehaviors:(id)arg1 forClients:(id)arg2;
- (id)historyForClients:(id)arg1 textEntryBehaviors:(id)arg2;
- (id)init;
- (id)managedObjectContext;
- (id)managedObjectModel;
- (id)persistentStoreCoordinator;
- (void)registerClient:(id)arg1 withTextEntryBehaviors:(id)arg2 maxItemsPerBehavior:(id)arg3;
- (void)setHistoryItem:(id)arg1 forClients:(id)arg2 textEntryBehaviors:(id)arg3;

@end
