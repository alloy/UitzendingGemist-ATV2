//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class NSString;

@interface BRTimer : NSObject
{
    BOOL _cancel;
    NSString *_name;
    double _interval;
}

+ (id)createTimerWithName:(id)arg1;
@property BOOL cancel; // @synthesize cancel=_cancel;
- (void)dealloc;
- (id)initWithName:(id)arg1;
- (void)reset;

@end

