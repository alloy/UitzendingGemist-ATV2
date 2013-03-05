/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRDataStore.h"

@class NSSet, NSString;

@interface BRSeriesDataStore : BRDataStore {
@private
	NSSet *_seriesMediaTypes;	// 40 = 0x28
	NSString *_seriesName;	// 44 = 0x2c
	int _seriesDataStoreType;	// 48 = 0x30
}
+ (id)byDateDataStoreWithTypes:(id)types;	// 0x36740a4d
+ (id)byMostRecentDataStoreWithTypes:(id)types;	// 0x36740b49
+ (id)byShowDataStoreWithTypes:(id)types forSeries:(id)series;	// 0x36740aa1
+ (id)byUnwatchedByMostRecentDataStoreWithTypes:(id)types;	// 0x36740b9d
+ (id)byUnwatchedDataStoreWithTypes:(id)types forSeries:(id)series;	// 0x36740af5
- (id)_aggregateSeries:(id)series aggregate:(id)aggregate sortByDate:(BOOL)date;	// 0x36741305
- (id)_filteredSeriesFrom:(id)from;	// 0x3674177d
- (id)_groupEpisodesIntoSeries:(id)series filterOutWatched:(BOOL)watched sortByDate:(BOOL)date;	// 0x367418d5
- (id)_groupSeriesIntoSeasons:(id)seasons filterOutWatched:(BOOL)watched;	// 0x36741ab5
- (void)_handleObjectModifiedForMostRecentUnwatchedDataStore:(id)mostRecentUnwatchedDataStore;	// 0x36741d81
- (id)_initWithSeriesTypes:(id)seriesTypes seriesName:(id)name dataStoreType:(int)type;	// 0x3674127d
- (id)_labelForSeason:(int)season;	// 0x3674165d
- (id)_mediaTypePredicate;	// 0x367414d5
- (id)_primaryCollectionTitlesFromData:(id)data;	// 0x36741c71
- (id)_seriesPredicate;	// 0x36741601
- (id)_sortResultsByDate:(id)date;	// 0x367416b9
- (void)addObject:(id)object;	// 0x36740d15
- (void)dealloc;	// 0x36740bf1
- (id)hashForData:(id)data;	// 0x36741179
- (id)loadData;	// 0x36740e35
- (void)objectModified:(id)modified;	// 0x36740d89
- (void)removeObject:(id)object;	// 0x36740e25
- (BOOL)storeAppliesToObject:(id)object;	// 0x36740c51
@end

