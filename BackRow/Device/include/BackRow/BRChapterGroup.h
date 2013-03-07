//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class ATVFeedDocument, ATVFeedEventGroupElement, NSArray, NSDate, NSDictionary, NSString;

@interface BRChapterGroup : NSObject
{
    ATVFeedDocument *_feedDocument;
    NSString *_groupName;
    NSArray *_chapters;
    NSString *_refreshURL;
    unsigned int _refreshIntervalInSeconds;
    NSDate *_startDate;
    BOOL _showChapterMarkers;
    BOOL _showDescriptionOnChapterSkip;
    NSDictionary *_feedDictionary;
    ATVFeedEventGroupElement *_feedElement;
}

- (id)_chaptersFromFeedDictionary:(id)arg1;
- (id)_chaptersFromFeedElement:(id)arg1;
- (unsigned int)chapterCount;
@property(readonly) NSArray *chapters; // @synthesize chapters=_chapters;
- (void)dealloc;
@property(readonly) NSDictionary *feedDictionary; // @synthesize feedDictionary=_feedDictionary;
@property(readonly) ATVFeedEventGroupElement *feedElement; // @synthesize feedElement=_feedElement;
@property(readonly) NSString *groupName; // @synthesize groupName=_groupName;
- (id)initWithFeedDictionary:(id)arg1;
- (id)initWithFeedElement:(id)arg1;
- (id)initWithGroupName:(id)arg1 feedDictionary:(id)arg2;
@property(readonly) unsigned int refreshIntervalInSeconds; // @synthesize refreshIntervalInSeconds=_refreshIntervalInSeconds;
@property(retain) NSString *refreshURL; // @synthesize refreshURL=_refreshURL;
@property(readonly) BOOL showChapterMarkers; // @synthesize showChapterMarkers=_showChapterMarkers;
@property(readonly) BOOL showDescriptionOnChapterSkip; // @synthesize showDescriptionOnChapterSkip=_showDescriptionOnChapterSkip;
@property(readonly) NSDate *startDate; // @synthesize startDate=_startDate;

@end

