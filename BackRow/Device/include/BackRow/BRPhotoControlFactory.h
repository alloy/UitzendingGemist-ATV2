//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRControlFactory-Protocol.h"
#import "BRControlHeightFactory-Protocol.h"

@class NSDateFormatter;

@interface BRPhotoControlFactory : NSObject <BRControlFactory, BRControlHeightFactory>
{
    id <BRSelectionHandler> _selectionHandler;
    NSDateFormatter *_formatter;
    BOOL _useMinimumImages;
    BOOL _useLocalProviders;
}

+ (id)mainMenuFactory;
+ (id)standardFactory;
- (id)_cyclerForData:(id)arg1;
- (id)_cyclerItemForData:(id)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (void)_decorateControlWithPlayIcon:(id)arg1 forMediaObject:(id)arg2;
- (id)_gridItemForData:(id)arg1;
- (id)_menuItemForData:(id)arg1;
- (id)_previewControlForData:(id)arg1;
- (id)_shelfItemForData:(id)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (id)_subtitleForCollection:(id)arg1;
- (id)controlForData:(id)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (void)dealloc;
- (id)formatter;
- (float)heightForControlForData:(id)arg1 requestedBy:(id)arg2;
- (id)initForMainMenu:(BOOL)arg1;
- (id)selectionHandler;
- (void)setSelectionHandler:(id)arg1;
- (void)setUseMinimumImages:(BOOL)arg1;
- (BOOL)useMinumumImages;

@end

