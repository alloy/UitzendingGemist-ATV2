//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class NSArray, NSMutableArray;

@interface BRTableView : BRControl
{
    id _dataSource;
    id _delegate;
    BOOL _showingHeader;
    NSArray *_rows;
    NSMutableArray *_widthValues;
    BOOL _reloadNeeded;
    BOOL _rowsUseColorBanding;
}

- (void)_createRows;
- (void)_reloadIfNeeded;
- (id)_widthValues;
- (id)accessibilityLabel;
@property(nonatomic) id dataSource; // @synthesize dataSource=_dataSource;
- (void)dealloc;
@property(nonatomic) id delegate; // @synthesize delegate=_delegate;
- (float)headerYOrigin;
- (id)init;
- (void)layoutSubcontrols;
- (void)reload;
@property(nonatomic) BOOL rowsUseColorBanding; // @synthesize rowsUseColorBanding=_rowsUseColorBanding;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;

@end
