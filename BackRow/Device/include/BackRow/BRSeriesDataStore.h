//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRDataStore.h"

@class NSSet, NSString;

@interface BRSeriesDataStore : BRDataStore
{
    NSSet *_seriesMediaTypes;
    NSString *_seriesName;
    int _seriesDataStoreType;
}

+ (id)byDateDataStoreWithTypes:(id)arg1;
+ (id)byMostRecentDataStoreWithTypes:(id)arg1;
+ (id)byShowDataStoreWithTypes:(id)arg1 forSeries:(id)arg2;
+ (id)byUnwatchedByMostRecentDataStoreWithTypes:(id)arg1;
+ (id)byUnwatchedDataStoreWithTypes:(id)arg1 forSeries:(id)arg2;
- (id)_aggregateSeries:(id)arg1 aggregate:(id)arg2 sortByDate:(BOOL)arg3;
- (id)_filteredSeriesFrom:(id)arg1;
- (id)_groupEpisodesIntoSeries:(id)arg1 filterOutWatched:(BOOL)arg2 sortByDate:(BOOL)arg3;
- (id)_groupSeriesIntoSeasons:(id)arg1 filterOutWatched:(BOOL)arg2;
- (void)_handleObjectModifiedForMostRecentUnwatchedDataStore:(id)arg1;
- (id)_initWithSeriesTypes:(id)arg1 seriesName:(id)arg2 dataStoreType:(int)arg3;
- (id)_labelForSeason:(int)arg1;
- (id)_mediaTypePredicate;
- (id)_primaryCollectionTitlesFromData:(id)arg1;
- (id)_seriesPredicate;
- (id)_sortResultsByDate:(id)arg1;
- (void)addObject:(id)arg1;
- (void)dealloc;
- (id)hashForData:(id)arg1;
- (id)loadData;
- (void)objectModified:(id)arg1;
- (void)removeObject:(id)arg1;
- (BOOL)storeAppliesToObject:(id)arg1;

@end

