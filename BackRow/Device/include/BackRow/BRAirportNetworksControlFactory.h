//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "BRControlFactory.h"
#import "BRControlHeightFactory.h"

__attribute__((visibility("hidden")))
@interface BRAirportNetworksControlFactory : NSObject <BRControlFactory, BRControlHeightFactory>
{
}

- (id)controlForData:(id)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (float)heightForControlForData:(id)arg1 requestedBy:(id)arg2;

@end

