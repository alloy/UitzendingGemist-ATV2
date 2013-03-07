//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import <AppleTV/BRControl.h>

#import "BRTabControlDelegate.h"

@class BRCoverArtPreviewControl, BRImage, BRImageControl, BRMediaPlayer, BRReflectionControl, BRTabControl, BRTextControl, BRVideoChapterProvider, BRWaitPromptControl;

__attribute__((visibility("hidden")))
@interface BRChapterSubtitleAudioPickerControl : BRControl <BRTabControlDelegate>
{
    BRImage *_currentVideoFrame;
    BRControl *_screenShotPreviewAndReflectionComboControl;
    BRImageControl *_screenShotPreviewControl;
    BRReflectionControl *_reflectionToPreviewControl;
    BRVideoChapterProvider *_chapterProvider;
    BRCoverArtPreviewControl *_preview;
    BRControl *_csaPicker;
    BRTabControl *_tabControl;
    BRTextControl *_titleControl;
    BRMediaPlayer *_player;
    BRControl *_currentContentControl;
    BRControl *_chapterPicker;
    BRWaitPromptControl *_spinner;
    BOOL _controlWasActivated;
    BOOL _controlWasDeactivated;
}

+ (id)controlWithPlayer:(id)arg1;
- (void)_addCSAPicker;
- (void)_addFullScreenVideoSnapshot;
- (void)_animatePreviewBackToScreenshot;
- (void)_animateScreenshotToPreview;
- (BOOL)_chapterPreviewsAvailable;
- (void)_createCSAPicker;
- (void)_endPositionForPreview:(struct CGPoint *)arg1 forReflection:(struct CGPoint *)arg2;
- (void)_loadAudioList;
- (void)_loadChapters;
- (void)_loadGraphicalChapterList;
- (void)_loadMediaOptionList:(id)arg1 selectedOption:(id)arg2 selectionHandler:(id)arg3;
- (void)_loadSubtitleList;
- (void)_loadTextualChapterList;
- (void)_setAudioOption:(id)arg1;
- (void)_setChapter:(id)arg1;
- (void)_setSubtitleOption:(id)arg1;
- (id)_titleControlItemLabelAttributes;
- (void)animationDidStop:(id)arg1 finished:(BOOL)arg2;
- (BOOL)brEventAction:(id)arg1;
- (void)controlWasActivated;
- (void)dealloc;
- (id)init;
- (void)layoutSubcontrols;
- (void)orderOut;
- (void)setPlayer:(id)arg1;
- (void)tabControl:(id)arg1 didSelectTabItem:(id)arg2;
- (void)tabControl:(id)arg1 willSelectTabItem:(id)arg2;
- (void)tabControlDidChangeNumberOfTabItems:(id)arg1;

@end

