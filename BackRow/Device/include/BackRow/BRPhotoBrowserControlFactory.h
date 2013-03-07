//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRControlFactory-Protocol.h"
#import "BRControlHeightFactory-Protocol.h"

__attribute__((visibility("hidden")))
@interface BRPhotoBrowserControlFactory : NSObject <BRControlFactory, BRControlHeightFactory>
{
    id <BRSelectionHandler> _handler;
}

- (id)controlForData:(id)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (void)dealloc;
- (float)heightForControlForData:(id)arg1 requestedBy:(id)arg2;
- (void)setSelectionHandler:(id)arg1;

@end

