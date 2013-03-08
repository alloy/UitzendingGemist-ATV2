//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class NSDictionary;

@interface BREvent : NSObject
{
    NSDictionary *_eventDictionary;
    int _action;
    double _timeStamp;
    int _value;
    unsigned int _originator;
    BOOL _allowRetrigger;
    BOOL _retrigger;
}

+ (id)eventWithAction:(int)arg1 value:(int)arg2;
+ (id)eventWithAction:(int)arg1 value:(int)arg2 atTime:(double)arg3;
+ (id)eventWithAction:(int)arg1 value:(int)arg2 atTime:(double)arg3 originator:(unsigned int)arg4;
+ (id)eventWithAction:(int)arg1 value:(int)arg2 atTime:(double)arg3 originator:(unsigned int)arg4 eventDictionary:(id)arg5 allowRetrigger:(BOOL)arg6;
+ (id)eventWithEvent:(id)arg1 originator:(unsigned int)arg2;
+ (id)eventWithEvent:(id)arg1 originator:(unsigned int)arg2 eventDictionary:(id)arg3 allowRetrigger:(BOOL)arg4;
- (BOOL)allowRetrigger;
- (void)dealloc;
- (id)description;
- (id)eventDictionary;
- (id)initWithAction:(int)arg1 value:(int)arg2;
- (id)initWithAction:(int)arg1 value:(int)arg2 atTime:(double)arg3;
- (id)initWithAction:(int)arg1 value:(int)arg2 atTime:(double)arg3 originator:(unsigned int)arg4;
- (id)initWithAction:(int)arg1 value:(int)arg2 atTime:(double)arg3 originator:(unsigned int)arg4 eventDictionary:(id)arg5 allowRetrigger:(BOOL)arg6;
- (BOOL)isEqual:(id)arg1;
- (void)makeRetriggerEvent;
- (unsigned int)originator;
- (int)remoteAction;
- (BOOL)retriggerEvent;
- (double)timeStamp;
- (int)value;

@end

