//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

@class BRActionShelfControl, BRCoverArtPreviewControl, BRTextControl;

@interface BRDetailedMediaControl : BRControl
{
    BRControl *_metadata;
    BRCoverArtPreviewControl *_coverArtPreviewControl;
    BRControl *_textLine;
    BRControl *_previewBrowser;
    BRActionShelfControl *_actionShelf;
    BRTextControl *_expiryText;
    id <BRProvider> _metadataProvider;
    id <BRProvider> _textLineProvider;
    id <BRProvider> _previewBrowserProvider;
    int _style;
    BOOL _detailsTogglingEnabled;
    BOOL _autoRefreshMetadata;
}

- (void)_focusedActionChanged:(id)arg1;
- (id)accessibilityScreenContent;
- (id)actionProviders;
- (BOOL)brEventAction:(id)arg1;
- (id)coverArtPreviewControl;
- (void)dealloc;
- (int)detailControlStyle;
- (id)detailedMetadataControl;
- (void)enableDetailsToggling;
- (struct CGRect)focusCursorFrame;
- (id)init;
- (void)invokeActionSelectionHandler;
- (void)layoutSubcontrols;
- (id)metadataProvider;
- (id)previewBrowserProvider;
- (void)setActionFocusedIndex:(long)arg1;
- (void)setActionProviders:(id)arg1;
- (void)setActionSelectionHandler:(id)arg1;
- (void)setActionStyle:(int)arg1;
- (void)setAutoRefreshMetadata:(BOOL)arg1;
- (void)setCoverArtPreviewControl:(id)arg1;
- (void)setDetailControlStyle:(int)arg1;
- (void)setDetailedMetadataControl:(id)arg1;
- (void)setExpiryText:(id)arg1;
- (void)setImageProxy:(id)arg1;
- (void)setMediaType:(id)arg1;
- (void)setMetadataProvider:(id)arg1;
- (void)setPreviewBrowserProvider:(id)arg1;
- (void)setTextLine:(id)arg1;
- (void)setTextLineProvider:(id)arg1;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (id)textLineProvider;

@end

