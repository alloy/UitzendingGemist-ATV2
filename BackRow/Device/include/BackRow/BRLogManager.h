//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



__attribute__((visibility("hidden")))
@interface BRLogManager : NSObject
{
}

+ (void)initialize;
+ (BOOL)isClassNameRegistered:(id)arg1;
+ (BOOL)isClassRegistered:(Class)arg1;
+ (void)logMessage:(id)arg1 fromSource:(id)arg2 args:(void *)arg3;
+ (void)registerClass:(Class)arg1;
+ (void)registerClassWithName:(id)arg1;
+ (void)resetRegisteredClasses;
+ (void)unregisterClass:(Class)arg1;

@end

