//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

#import "BRContainerViewCell-Protocol.h"

@class BRContainerViewDataCache, BRCursorControl, NSMutableArray, NSTimer;

@interface BRGridView : BRControl <BRContainerViewCell>
{
    int _mode;
    BRControl *_requester;
    struct _NSRange _range;
    float _lastGapHeight;
    double _heightToRange;
    double _controlHeight;
    CDStruct_1420b1e7 _columWidth;
    CDStruct_1420b1e7 _horizontalGap;
    CDStruct_1420b1e7 _verticalGap;
    float _leftMargin;
    float _rightMargin;
    float _bottomMargin;
    float _bottomMarginFactor;
    float _topMargin;
    float _topMarginFactor;
    int _navigationBehavior;
    id _dataSource;
    id _delegate;
    BRCursorControl *_trackingCursor;
    BOOL _needsReload;
    NSMutableArray *_editEventQueue;
    long _loadIndex;
    NSTimer *_forceDisplayTimer;
    BOOL _followsLoadAndDisplayOnDemand;
    CDUnknownBlockType _loadCompletionBlock;
    BOOL _toldToLoad;
    NSMutableArray *_completedIndexes;
    BRContainerViewDataCache *_dataCache;
    CDStruct_1420b1e7 _itemHeight;
    long _defaultFocusIndex;
}

+ (id)_jitterPositionAnimation;
+ (id)_jitterTransformAnimation;
- (BOOL)_allDisplayComplete;
- (void)_animationDidStartInDisplayMode:(id)arg1;
- (void)_animationDidStartInEditModeMode:(id)arg1;
- (void)_animationDidStopInDisplayMode:(id)arg1 finished:(BOOL)arg2;
- (void)_animationDidStopInEditMode:(id)arg1 finished:(BOOL)arg2;
- (id)_completedIndexes;
- (id)_controlAtIndex:(long)arg1 controls:(id)arg2;
- (long)_controlsInHeight:(double)arg1 startingAt:(long)arg2 actualHeight:(double *)arg3;
- (long)_controlsInHeightBackwards:(double)arg1 startingAt:(long)arg2 actualHeight:(double *)arg3;
- (id)_controlsInRange:(struct _NSRange)arg1;
- (id)_createControlsInRange:(struct _NSRange)arg1;
- (void)_displayControlsForRowThatContainsIndex:(long)arg1 force:(_Bool)arg2;
- (void)_focusChanged:(id)arg1;
- (void)_forceDisplayTimerFired:(id)arg1;
- (struct CGRect)_frameForControlAtIndex:(long)arg1 controls:(id)arg2;
- (struct CGRect)_frameForControlAtIndex:(long)arg1 rowFrame:(struct CGRect)arg2 controls:(id)arg3;
- (void)_frameRowInRange:(struct _NSRange)arg1 rowFrame:(struct CGRect)arg2 controls:(id)arg3;
- (BOOL)_handleEventInDisplayMode:(id)arg1;
- (BOOL)_handleEventInEditMode:(id)arg1;
- (float)_heightOfControlAtIndex:(long)arg1 controls:(id)arg2;
- (double)_heightOfRowsInRange:(struct _NSRange)arg1 includeVerticalGap:(BOOL)arg2 controls:(id)arg3;
- (double)_heightToRange;
- (long)_indexOfFocusedControl;
- (void)_layoutSubcontrols;
- (void)_loadControlWithIndex:(long)arg1 start:(BOOL)arg2;
- (BOOL)_okToLoadWithIndex:(long)arg1;
- (float)_positionOfColumn:(long)arg1 inRowWidth:(float)arg2 cellWidth:(float *)arg3;
- (void)_reloadIfNeeded;
- (void)_restorePersistentSavedSelection;
- (float)_rowHeightForControlsInRange:(struct _NSRange)arg1 controls:(id)arg2;
- (id)_setControlRange:(struct _NSRange)arg1 withHeightToRange:(double)arg2;
- (BOOL)_setMode:(int)arg1;
- (void)_setSelectedItemJiggling:(BOOL)arg1;
- (void)_stopForceDisplayTimer;
- (BOOL)_swapControlAtIndex:(long)arg1 withControlAtIndex:(long)arg2;
- (id)_swapPositionAnimationFromIndex:(long)arg1 toIndex:(long)arg2;
- (double)_totalHeight;
- (void)_updatePersistentSavedSelection;
- (id)accessibilityControls;
- (void)animationDidStart:(id)arg1;
- (void)animationDidStop:(id)arg1 finished:(BOOL)arg2;
- (float)bottomMargin;
- (BOOL)brEventAction:(id)arg1;
- (void)cancelContainerViewLoad;
- (CDStruct_1420b1e7)columnWidth;
- (BOOL)controlAcceptsFocusAtIndex:(long)arg1;
- (struct CGRect)controlFocusFrameAtIndex:(long)arg1;
- (struct CGRect)controlFrameAtIndex:(long)arg1;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (unsigned int)countOfCells;
- (id)cursor;
- (long)dataCount;
- (id)dataSource;
- (void)dealloc;
@property(nonatomic) long defaultFocusIndex; // @synthesize defaultFocusIndex=_defaultFocusIndex;
- (id)delegate;
- (void)didFocusItemAtIndex:(long)arg1;
- (BOOL)didPlayItemAtIndex:(long)arg1;
- (BOOL)didSelectItemAtIndex:(long)arg1;
- (void)didUnFocusItemAtIndex:(long)arg1;
- (void)focusControlAtIndex:(long)arg1;
- (id)focusedControlForEvent:(id)arg1 focusPoint:(struct CGPoint *)arg2;
- (void)grid:(id)arg1 didFocusItemAtIndex:(long)arg2;
- (void)grid:(id)arg1 didSelectItemAtIndex:(long)arg2;
- (void)grid:(id)arg1 didUnFocusItemAtIndex:(long)arg2;
- (float)grid:(id)arg1 heightForItemAtIndex:(long)arg2;
- (id)grid:(id)arg1 itemAtIndex:(long)arg2;
- (void)grid:(id)arg1 willDisplayItemAtIndex:(long)arg2;
- (long)grid:(id)arg1 willFocusItemAtIndex:(long)arg2;
- (void)grid:(id)arg1 willUnFocusItemAtIndex:(long)arg2;
- (float)heightForItemAtIndex:(long)arg1;
- (float)heightOfControlAtIndex:(long)arg1;
- (float)heightToMaximum:(float)arg1;
- (CDStruct_1420b1e7)horizontalGap;
- (long)indexForItemID:(id)arg1;
- (unsigned int)indexInCellsOfObject:(id)arg1;
- (id)init;
- (id)initWithLayout:(id)arg1;
- (id)initialFocus;
- (id)itemAtIndex:(long)arg1;
@property(nonatomic) CDStruct_1420b1e7 itemHeight; // @synthesize itemHeight=_itemHeight;
- (id)itemIDAtIndex:(long)arg1;
- (void)layoutSubcontrols;
- (float)leftMargin;
- (void)loadWithCompletionBlock:(CDUnknownBlockType)arg1;
@property(nonatomic) int navigationBehavior; // @synthesize navigationBehavior=_navigationBehavior;
- (long)numberOfColumns;
- (long)numberOfColumnsInGrid:(id)arg1;
- (long)numberOfItems;
- (long)numberOfItemsInGrid:(id)arg1;
- (id)objectInCellsAtIndex:(unsigned int)arg1;
- (void)populateDataCache:(id)arg1;
- (float)positionOfColumn:(long)arg1;
- (void)reload;
- (void)reloadItemAtIndex:(long)arg1;
- (void)reloadItemsAtIndexes:(id)arg1;
- (void)restorePersistentSavedSelection;
- (float)rightMargin;
- (long)rowCount;
- (void)scrollingCompleted;
- (void)selectItemAtIndex:(long)arg1;
- (long)selectedIndex;
- (id)selectedObject;
- (long)selection;
- (void)setBottomMargin:(float)arg1;
- (void)setColumnWidth:(CDStruct_1420b1e7)arg1;
- (void)setCursor:(id)arg1;
- (void)setDataSource:(id)arg1;
- (void)setDelegate:(id)arg1;
- (void)setFollowsLoadAndDisplayOnDemand;
- (void)setHorizontalGap:(CDStruct_1420b1e7)arg1;
- (void)setIgnoreLoadAndDisplayOnDemand;
- (void)setIgnoreLoadAndDisplayOnDemandDisableAnimations:(BOOL)arg1;
- (void)setLeftMargin:(float)arg1;
- (void)setNeedsReload;
- (void)setReadyToDisplay;
- (void)setRightMargin:(float)arg1;
- (void)setSelection:(long)arg1;
- (void)setTopMargin:(float)arg1;
- (void)setVerticalGap:(CDStruct_1420b1e7)arg1;
- (void)setVerticalMargins:(float)arg1;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (float)topMargin;
- (void)updatePersistentSavedSelection;
- (CDStruct_1420b1e7)verticalGap;
- (id)visibleControlAtIndex:(long)arg1;
- (id)visibleControlsWithRange:(struct _NSRange *)arg1;
- (struct _NSRange)visibleRange;
- (void)visibleScrollRectChanged;
- (void)willDisplayItemAtIndex:(long)arg1;
- (long)willFocusItemAtIndex:(long)arg1;
- (void)willUnFocusItemAtIndex:(long)arg1;
- (void)windowMaxBoundsChanged;

@end

