//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

//#import "ATVProgressMonitorConfiguration.h"

@class BRBackgroundTask, NSArray, NSDictionary, NSMutableDictionary, NSNumber, NSString, NSTimer;

@interface BRMusicStore : BRSingleton //<ATVProgressMonitorConfiguration>
{
    int _musicStoreLoadState;
    NSDictionary *_storeFrontsDictionary;
    NSDictionary *_storeFrontCodesDictionary;
    NSNumber *_storeFrontID;
    NSArray *_rootCollection;
    NSArray *_partnerData;
    id <BRMediaProvider> _provider;
    BOOL _initializing;
    NSString *_selectedLanguageCode;
    NSString *_storeMainMenuPresentsKey;
    struct dispatch_queue_s *_urlBagQueue;
    NSDictionary *_urlBag;
    BRBackgroundTask *_bagReloadTask;
    NSTimer *_retryTimer;
    NSString *_platform;
    BOOL _initializePlatform;
    NSMutableDictionary *_languageIDForLanguageCodeCache;
    BOOL _dsidSentWithLastStoreRefresh;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (id)URLBagEntryForKey:(id)arg1;
- (id)_acceptLanguage;
- (void)_bootstrapMusicStore;
- (void)_bootstrapMusicStoreFromURL:(id)arg1;
- (id)_canonicalNameForMediaType:(id)arg1;
- (id)_currentStoreFrontsFilePath;
- (id)_defaultStoreFrontsFilePath;
- (id)_determineLanguageCodeForStoreFront:(id)arg1;
- (void)_initializeGhostrider;
- (BOOL)_initializeMusicStore;
- (id)_languageIDForLanguageCode:(id)arg1;
- (BOOL)_loadRootCollection:(id)arg1;
- (double)_maxAgeFromResponseHeaders:(id)arg1;
- (void)_networkStateChanged:(id)arg1;
- (id)_primaryMusicStoreURL;
- (void)_requestStoreFrontList;
- (void)_retryRootCollection:(id)arg1;
- (void)_rootCollectionLoaded:(id)arg1;
- (void)_seedMusicStore:(id)arg1;
- (BOOL)_seedMusicStoreWithBag:(id)arg1;
- (void)_seedRequestProcessed:(id)arg1;
- (void)_setCurrentStoreFrontID:(id)arg1 language:(id)arg2 platform:(id)arg3;
- (void)_setRootCollection:(id)arg1;
- (void)_storeFrontListRequestProcessed:(id)arg1;
- (id)_storeFrontsDictionary;
- (id)_storeLanguageID;
- (void)_storeLoadFailed:(id)arg1;
- (void)_updateDateAndTimeFromResponse:(id)arg1;
- (void)_updateReloadTaskWithInterval:(double)arg1;
- (void)_updateStoreFrontFromResponse:(id)arg1;
- (id)_ytURLDictPath;
- (id)bandwidthHintReadyToPlayMaxTimeInSeconds;
- (id)beaconingPuntRatio;
- (id)beaconingURLString;
- (id)bookmarkSaveInterval;
- (id)cacheBusterURLForURL:(id)arg1;
- (id)commonHeaders;
- (id)currentStoreFrontID;
- (id)currentStoreFrontISO3166Code;
- (void)dealloc;
- (void)decomposeCompositeStoreFrontHeader:(id)arg1;
- (void)delayedRootCollectionReset;
- (id)downloadCapBytesSpeedtest;
- (id)downloadCapInSecondsSpeedtest;
- (id)downloadMovieSpeedTestURLsArray;
- (id)downloadSpeedTestKVSDomain;
- (id)downloadSpeedTestPostResultsURLString;
- (id)downloadSpeedTestURLsArray;
@property BOOL dsidSentWithLastStoreRefresh; // @synthesize dsidSentWithLastStoreRefresh=_dsidSentWithLastStoreRefresh;
- (id)init;
- (id)keyValueStoreGetAllURLString;
- (id)keyValueStorePutAllURLString;
- (id)matchLogoPath;
- (id)matchStoreCategory;
- (int)musicStoreLoadState;
- (id)previewBandwidthHintPromptTime;
- (id)provider;
- (void)purgeMusicStore;
- (void)refreshURLBag;
- (id)rootCollection;
- (id)rootCollectionForMediaType:(id)arg1;
- (void)setCurrentStoreFrontID:(id)arg1;
- (void)setCurrentStoreFrontID:(id)arg1 language:(id)arg2;
- (void)setMusicStoreLoadState:(int)arg1;
- (id)storeFronts;
- (id)storeHeadersDictionary;
- (id)storeHeadersWithDsid;
- (id)storeMainMenuPresentsURLKey;
- (id)storeRecommendationsURL;
- (id)storeRelatedMoviesURLString;
- (id)storeViewMovieURLString;
- (id)userAgent;
- (id)vendorBags;
- (id)ytAuthURLBase;
- (id)ytURLBase;

@end

