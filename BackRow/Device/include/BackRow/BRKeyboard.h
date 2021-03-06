//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@class BRControl, BRGridView, BRKeyboardControl, BRTextEntryControl, NSArray, NSMutableArray, NSString;

__attribute__((visibility("hidden")))
@interface BRKeyboard : NSObject
{
    BRTextEntryControl *_textEntryControl;
    BRControl *_baseKeyControl;
    BRKeyboard *_baseKeyboard;
    NSString *_name;
    BRKeyboardControl *_keyboardControl;
    BRGridView *_mainKeysGrid;
    NSMutableArray *_mainKeyControls;
    BRControl *_actionKeysContainer;
    NSMutableArray *_actionKeyControls;
    NSArray *_keyDataDictionaries;
    BOOL _shouldShowLanguageSwitchButton;
    BOOL _constrainCursorToPopupKeyboard;
    BOOL _canWrapHorizontally;
    BOOL _canWrapVertically;
}

- (void)_accessibilityApplyImageLabel:(id)arg1 name:(id)arg2;
- (float)_actionKeysContainerSpacing;
- (float)_actionKeysContainerWidth;
- (id)_controlForData:(id)arg1;
- (struct CGColor *)_createColorFromDictionary:(id)arg1;
- (void)_createMainAndActionKeyControls;
- (id)_filterRawKeyboardData:(id)arg1;
- (id)_glyphDataForImage:(id)arg1;
- (id)_glyphDataForStrings:(id)arg1 attributes:(id)arg2;
- (id)_glyphDataForTextString:(id)arg1 attributes:(id)arg2;
- (void)_handleActionKeySelectionEvent:(id)arg1;
- (Class)_keyboardControlClass;
- (id)_keyboardDataFileName;
- (id)_mainKeyRowPlane;
- (float)_mainKeysHorizontalSpacing;
- (float)_mainKeysVerticalSpacing;
- (int)_numberOfActionKeyColumns;
- (int)_numberOfActionKeyRows;
- (int)_numberOfMainKeyColumns;
- (int)_numberOfMainKeyRows;
- (int)_numberOfMainKeysInLastRow;
- (id)_optionCharactersForKeyboardInput;
- (id)_popupKeyboardDataFileName;
- (BOOL)_popupKeyboardValidForGlyph:(id)arg1;
- (float)_preferredColumnWidthForMainKeysGrid;
- (float)_preferredGlyphHeight:(id)arg1;
- (struct CGSize)_preferredGlyphSize:(id)arg1;
- (float)_preferredGlyphWidth:(id)arg1;
- (float)_preferredTextEntryControlWidth;
- (id)_processGlyphDataChunk:(id)arg1;
- (void)_replaceActionKeysContainerWithContainer:(id)arg1;
- (float)_verticalGapBetweenMainAndActionKeys;
- (id)actionDictionaryForKeyControl:(id)arg1;
- (id)allPopupkeyboardsCharacterSet;
- (id)attributesForTextFieldLabel;
- (id)baseKeyControl;
- (id)baseKeyboard;
- (BOOL)canShowLanguageSwitchButton;
- (BOOL)canWrapHorizontally;
- (BOOL)canWrapVertically;
- (struct CGRect)candidatesBackgroundFrame;
- (struct CGRect)candidatesContainerFrame;
- (id)customizeTextEntryControls:(id)arg1;
- (id)customizedTextEntryFieldControls;
- (void)customizedTextFieldControlsWereRemoved;
- (void)dealloc;
- (id)focusedControlForActionKeysContainer:(id)arg1;
- (id)focusedControlForRow:(id)arg1;
- (struct CGRect)frameForPopupKeyboardControl:(id)arg1 baseKeyControl:(id)arg2;
- (void)grid:(id)arg1 didSelectItemAtIndex:(long)arg2;
- (float)grid:(id)arg1 heightForItemAtIndex:(long)arg2;
- (id)grid:(id)arg1 itemAtIndex:(long)arg2;
- (BOOL)handleEvent:(id)arg1;
- (id)init;
- (id)initWithBaseKeyControl:(id)arg1 baseKeyboard:(id)arg2 textEntryControl:(id)arg3;
- (id)keyDataDictionaries;
- (id)keyboardCharacterSet;
- (id)keyboardControl;
- (struct CGRect)keyboardControlFrame;
- (float)layoutGapBelowKeyboardControl;
- (float)layoutGapBelowTabControl;
- (id)mainKeyControls;
- (int)mapVisualIndex:(int)arg1 toRow:(id)arg2;
- (id)name;
- (long)numberOfColumnsInGrid:(id)arg1;
- (long)numberOfItemsInGrid:(id)arg1;
- (int)numberOfKeyboardsForCurrentKeyboardType;
- (struct CGRect)playPauseFrame;
- (id)popupKeyboardForKeyControl:(id)arg1 textEntryControl:(id)arg2;
- (BOOL)popupKeyboardShouldBeRightAlignedForKey:(id)arg1;
- (BOOL)popupKeyboardShouldRemainDisplayedAfterCharacterSelection;
- (void)removeCustomizedTextEntryControls:(id)arg1;
- (BOOL)requiresTextFieldLabel;
- (void)setBaseKeyControl:(id)arg1;
- (void)setBaseKeyboard:(id)arg1;
- (void)setCanWrapHorizontally:(BOOL)arg1;
- (void)setCanWrapVertically:(BOOL)arg1;
- (void)setConstrainCursorToPopupKeyboard:(BOOL)arg1;
- (void)setFocusedControlWithVisualIndex:(int)arg1 forRow:(id)arg2;
- (void)setShouldShowLanguageSwitchButton:(BOOL)arg1;
- (void)setTextEntryControl:(id)arg1;
- (BOOL)shouldShowLanguageSwitchButton;
- (struct CGRect)spinnerFrame;
- (void)startSpinning;
- (void)stopSpinning;
- (id)switchToThisKeyboardIdentifier;
- (struct CGRect)tabControlFrame;
- (id)textEntryControl;
- (BOOL)textEntryControlShouldHandleActionKeysEvents;
- (BOOL)textEntryControlShouldHandleMainKeysEvents;
- (struct CGRect)textFieldBackgroundFrame;
- (struct CGRect)textFieldFrame;
- (struct CGRect)textFieldLabelFrame;
- (int)visualIndexOfControlWithName:(id)arg1 forRow:(id)arg2;
- (int)visualIndexOfFocusedControlForRow:(id)arg1;

@end

