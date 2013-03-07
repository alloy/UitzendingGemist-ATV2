//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

@class BRKeyboard, BRKeyboardCandidates, NSArray, NSMutableString, NSString;

__attribute__((visibility("hidden")))
@interface BRInputMethod : NSObject
{
    int _textEntryStyle;
    NSArray *_keyboards;
    BOOL _includeHistoryKeyboard;
    NSString *_mostRecentCandidateCharacter;
    NSMutableString *_candidatesBuffer;
    BRKeyboard *_activeKeyboard;
    BRKeyboardCandidates *_candidatesKeyboard;
}

- (id)_addHistoryKeyboard:(id)arg1;
- (id)_keyboardsForTextEntryStyle:(int)arg1;
- (id)_removeHistoryKeyboard:(id)arg1;
- (id)candidates;
- (id)candidatesKeyboard;
- (void)dealloc;
- (BOOL)deleteText;
- (void)flushText;
- (BOOL)includeHistoryKeyboard;
- (id)init;
- (BOOL)inputText:(id)arg1;
- (id)isoLanguageCode;
- (id)keyboards;
- (id)mostRecentCharacter;
- (id)name;
- (void)removeCandidatesKeyboard;
- (void)setActiveKeyboard:(id)arg1;
- (void)setIncludeHistoryKeyboard:(BOOL)arg1;
- (BOOL)setTextEntryStyle:(int)arg1 displayTextEntryHistory:(BOOL)arg2;
- (int)textEntryStyle;
- (BOOL)usesCandidateDisplayForKeyboard:(id)arg1;

@end

