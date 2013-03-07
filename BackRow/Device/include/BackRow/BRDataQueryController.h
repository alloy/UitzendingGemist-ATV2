//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRViewController.h>

@class BRMediaMenuView, NSArray, NSString, NSTimer;

@interface BRDataQueryController : BRViewController
{
    id _serverID;
    unsigned long _dataClientType;
    struct __ATVDataClient *_dataClient;
    BRMediaMenuView *_mediaMenuView;
    NSArray *_data;
    struct __ATVMediaQuery *_preDataQuery;
    struct __ATVMediaQuery *_dataQuery;
    struct __ATVMediaQuery *_previewQuery;
    NSTimer *_spinnerTimer;
    BOOL _showingSpinner;
    void *_dataItemToSelect;
    struct __ATVMediaQuery *_playQuery;
    BOOL _handlingDataClientUpdate;
    BOOL _refreshNeeded;
    BOOL _reloadListViewNeeded;
    NSTimer *_serverFoundWaitTimer;
    BOOL attemptConnectionOnServerRemove;
    NSString *_spinnerLoadingText;
}

+ (id)controllerForATVMediaType:(struct __ATVMediaType *)arg1 collection:(struct __ATVMediaCollection *)arg2 dataClient:(struct __ATVDataClient *)arg3 dataClientType:(unsigned long)arg4 playAllItems:(BOOL)arg5;
- (void)_dataClientConnectionHandler:(id)arg1;
- (void)_dataClientConnectionHandlerWithObject:(id)arg1;
- (void)_dataClientDataUpdated:(id)arg1;
- (void)_dataClientStatusChanged:(id)arg1;
- (void)_dataQueryComplete;
- (void)_dataServerConnectionHandler:(id)arg1;
- (void)_dataServerFailedToConnect:(id)arg1;
- (void)_dataServersChangedHandler:(id)arg1;
- (void)_displayErrorForQuery:(struct __ATVMediaQuery *)arg1;
- (void)_displayFailedToConnect;
- (void)_executeDataQuery;
- (void)_executePreDataQuery;
- (void)_handleDataQueryCompletion;
- (BOOL)_isDataServerEqual:(struct __ATVDataServer *)arg1;
- (void)_mediaItemPropertySetNotification:(id)arg1;
- (void)_playQueryComplete;
- (void)_preDataQueryComplete;
- (void)_previewQueryComplete;
- (void)_serverFoundWaitHandler:(id)arg1;
- (void)_setDataClient:(struct __ATVDataClient *)arg1;
- (void)_setDataQuery:(struct __ATVMediaQuery *)arg1;
- (void)_setPlayQuery:(struct __ATVMediaQuery *)arg1;
- (void)_setPreDataQuery:(struct __ATVMediaQuery *)arg1;
- (void)_setPreviewQuery:(struct __ATVMediaQuery *)arg1;
- (void)_setServerID:(id)arg1 dataClientType:(unsigned long)arg2;
- (void)_showMediaView;
- (void)_showSpinner:(BOOL)arg1;
- (void)_showSpinner:(BOOL)arg1 delay:(BOOL)arg2 displayLoadingText:(BOOL)arg3;
- (void)_showSpinnerTimer:(id)arg1;
- (void)_updateDisabledStateForMenusInList:(id)arg1;
- (id)accessibilityScreenContent;
@property(nonatomic) BOOL attemptConnectionOnServerRemove; // @synthesize attemptConnectionOnServerRemove;
- (id)controllerIdentifier;
- (struct __ATVMediaQuery *)createDataQuery;
- (struct __ATVMediaQuery *)createPlayQueryForIndexPath:(id)arg1;
- (struct __ATVMediaQuery *)createPreDataQuery;
- (struct __ATVMediaQuery *)createPreviewQueryForIndexPath:(id)arg1;
- (id)data;
@property(readonly, nonatomic) struct __ATVDataClient *dataClient; // @synthesize dataClient=_dataClient;
- (id)dataClientName;
- (unsigned long)dataClientType;
- (BOOL)dataClientUpdated:(id)arg1;
- (void *)dataItemAtIndexPath:(id)arg1;
- (void *)dataItemToSelect;
- (BOOL)dataQueryComplete:(struct __ATVMediaQuery *)arg1;
- (struct __ATVDataServer *)dataServer;
- (BOOL)dataServerConnectionChanged:(struct __ATVDataServer *)arg1;
- (void)dealloc;
- (id)defaultIndexPathToSelect;
- (id)errorControlForQuery:(struct __ATVMediaQuery *)arg1;
- (id)errorForNoContent;
- (id)identifier;
- (id)indexPathForDataItem:(void *)arg1;
- (id)initWithDataClient:(struct __ATVDataClient *)arg1 dataClientType:(unsigned long)arg2;
- (id)initWithServerID:(id)arg1 dataClientType:(unsigned long)arg2;
- (void)list:(id)arg1 didFocusItemAtIndexPath:(id)arg2;
- (void)list:(id)arg1 didPlayItemAtIndexPath:(id)arg2;
- (id)list:(id)arg1 menuItemForRowAtIndexPath:(id)arg2;
- (long)list:(id)arg1 numberOfRowsInSection:(long)arg2;
- (id)mediaMenuView;
- (void)playQueryComplete:(struct __ATVMediaQuery *)arg1;
- (BOOL)preDataQueryComplete:(id)arg1;
- (id)previewForItems:(id)arg1;
- (BOOL)previewQueryComplete:(struct __ATVMediaQuery *)arg1;
- (void)restartDataQueryProcess;
- (id)serverID;
- (void)setDataItemToSelect:(void *)arg1;
@property(retain, nonatomic) NSString *spinnerLoadingText; // @synthesize spinnerLoadingText=_spinnerLoadingText;
- (void)setTitle:(id)arg1;
- (id)waitControl;
- (void)wasExhumed;
- (void)wasPopped;
- (void)wasPushed;

@end

