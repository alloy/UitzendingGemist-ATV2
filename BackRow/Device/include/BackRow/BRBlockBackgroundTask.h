//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRBackgroundTask.h"

@interface BRBlockBackgroundTask : BRBackgroundTask
{
    CDUnknownBlockType _block;
}

+ (id)backgroundTaskWithInterval:(double)arg1 delay:(double)arg2 taskType:(int)arg3 withBlock:(CDUnknownBlockType)arg4;
- (void)dealloc;
- (id)initWithInterval:(double)arg1 delay:(double)arg2 taskType:(int)arg3 withBlock:(CDUnknownBlockType)arg4;
- (BOOL)perform:(id)arg1;

@end

