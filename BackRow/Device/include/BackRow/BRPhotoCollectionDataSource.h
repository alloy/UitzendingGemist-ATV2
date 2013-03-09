//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRCyclerDataSource-Protocol.h"
#import "BRCyclerDelegate-Protocol.h"

@class BRControl, BRPhotoControlFactory, BRStreamingPhotoCollection, NSMutableArray;

__attribute__((visibility("hidden")))
@interface BRPhotoCollectionDataSource : NSObject <BRCyclerDelegate, BRCyclerDataSource>
{
    BRStreamingPhotoCollection *_collection;
    BRPhotoControlFactory *_controlFactory;
    struct __ATVMediaQuery *_keyItemQuery;
    struct __ATVMediaQuery *_itemsQuery;
    NSMutableArray *_items;
    BRControl *_currentControl;
    BOOL _cyclerFocused;
    BOOL _itemsQueried;
}

//- (struct __ATVMediaQuery *)_createItemsQueryForCollection:(struct __ATVMediaCollection *)arg1 requestKeyAssetOnly:(BOOL)arg2;
- (void)_itemsQueryComplete:(struct __ATVMediaQuery *)arg1;
- (id)cycler:(id)arg1 itemAtIndex:(int)arg2;
- (void)cyclerWasFocused:(id)arg1;
- (void)cyclerWasUnfocused:(id)arg1;
- (void)dealloc;
- (id)initWithCollection:(id)arg1;
- (long)numberOfItemsInCycler:(id)arg1;
- (id)selectionHandler;
- (void)setSelectionHandler:(id)arg1;

@end
