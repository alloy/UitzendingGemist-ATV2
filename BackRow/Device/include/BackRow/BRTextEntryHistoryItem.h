//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSManagedObject.h"

@class BRTextEntryHistoryClient, NSDate, NSString;

__attribute__((visibility("hidden")))
@interface BRTextEntryHistoryItem : NSManagedObject
{
}


// Remaining properties
@property(retain, nonatomic) BRTextEntryHistoryClient *client; // @dynamic client;
@property(copy, nonatomic) NSString *historyItemString; // @dynamic historyItemString;
@property(retain, nonatomic) NSDate *lastUsedDate; // @dynamic lastUsedDate;
@end

