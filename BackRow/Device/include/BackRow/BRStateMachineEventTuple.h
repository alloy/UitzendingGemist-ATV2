//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class NSDictionary, NSString;

__attribute__((visibility("hidden")))
@interface BRStateMachineEventTuple : NSObject
{
    NSString *_event;
    id _context;
    NSDictionary *_userInfo;
}

@property(retain) id context; // @synthesize context=_context;
- (void)dealloc;
@property(retain) NSString *event; // @synthesize event=_event;
@property(retain) NSDictionary *userInfo; // @synthesize userInfo=_userInfo;

@end
