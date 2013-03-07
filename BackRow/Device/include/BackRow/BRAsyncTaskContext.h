//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class NSMutableArray, NSString;

@interface BRAsyncTaskContext : NSObject
{
    int _maxRunningTasks;
    int _numRunningTasks;
    NSMutableArray *_taskQueue;
    NSMutableArray *_allTasks;
    NSString *_name;
}

+ (id)defaultContext;
+ (void)initialize;
- (void)_addManagerObserverForTask:(id)arg1;
- (void)_cancelAllTasks;
- (void)_removeManagerObserverForTask:(id)arg1;
- (void)_scheduleNextTask:(id)arg1;
- (void)_taskComplete:(id)arg1;
- (void)_threadDeath:(id)arg1;
- (void)cancelTask:(id)arg1;
- (void)cancelTaskWithIdentifier:(id)arg1;
- (void)dealloc;
- (id)description;
- (id)initWithMaxTasks:(int)arg1;
- (id)initWithMaxTasks:(int)arg1 name:(id)arg2;
- (void)scheduleTask:(id)arg1;

@end

