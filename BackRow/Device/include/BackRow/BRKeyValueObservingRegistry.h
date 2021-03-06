//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class NSArray, NSIndexSet;

@interface BRKeyValueObservingRegistry : NSObject
{
    NSIndexSet *_indexesToRemove;
    NSArray *_observationEntries;
}

- (void)_addObservationEntry:(id)arg1 options:(unsigned int)arg2;
- (void)_removeObservationEntriesAtIndexes:(id)arg1 inDealloc:(BOOL)arg2;
- (void)dealloc;
- (id)init;
@property(retain) NSArray *observationEntries; // @synthesize observationEntries=_observationEntries;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
- (void)registerObserver:(id)arg1 ofObject:(id)arg2 forKeyPath:(id)arg3 handler:(CDUnknownBlockType)arg4;
- (void)registerObserver:(id)arg1 ofObject:(id)arg2 forKeyPath:(id)arg3 options:(unsigned int)arg4 handler:(CDUnknownBlockType)arg5;
- (void)unregisterAll;
- (void)unregisterObserver:(id)arg1;
- (void)unregisterObserversOfObject:(id)arg1;
- (void)unregisterObserversOfObject:(id)arg1 forKeyPath:(id)arg2;

@end

