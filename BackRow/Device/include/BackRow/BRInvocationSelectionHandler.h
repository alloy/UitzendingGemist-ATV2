//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRSelectionHandler-Protocol.h"

@class NSInvocation;

@interface BRInvocationSelectionHandler : NSObject <BRSelectionHandler>
{
    NSInvocation *_invocation;
    BOOL _useInvocationReturnValue;
}

+ (id)handlerWithInvocation:(id)arg1;
+ (id)handlerWithTarget:(id)arg1 selector:(SEL)arg2;
- (void)dealloc;
- (BOOL)handleSelectionForControl:(id)arg1;
- (id)initWithInvocation:(id)arg1;
- (id)invocation;
- (void)setUseInvocationReturnValue:(BOOL)arg1;
- (BOOL)useInvocationReturnValue;

@end

