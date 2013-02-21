/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/BackRow.framework/BackRow
 */

#import "BRTextField.h"
#import "BackRow-Structs.h"
#import "BRControl.h"
#import "WebWindowDelegate.h"

@class BRWebWindowControl, NSMutableString, NSURLRequest, BRCursorControl, NSMutableArray, NSValue, BRWebPointerControl, BRWebFormHelper;
@protocol BRWebControlDelegate;

@interface BRWebControl : BRControl <WebWindowDelegate, BRTextField> {
@private
	NSMutableArray *_eventListeners;	// 40 = 0x28
	NSURLRequest *_request;	// 44 = 0x2c
	id<BRWebControlDelegate> _delegate;	// 48 = 0x30
	BRWebWindowControl *_webPage;	// 52 = 0x34
	BRWebPointerControl *_pointer;	// 56 = 0x38
	BRWebFormHelper *_formHelper;	// 60 = 0x3c
	BRCursorControl *_cursor;	// 64 = 0x40
	NSValue *_restoreFocus;	// 68 = 0x44
	CGColorRef _defaultBackgroundColor;	// 72 = 0x48
	CGSize _pageSize;	// 76 = 0x4c
	double _savedAutoPresentTimeout;	// 84 = 0x54
	BOOL _layoutComplete;	// 92 = 0x5c
	BOOL _resetPage;	// 93 = 0x5d
	BOOL _hdtvfullscreen;	// 94 = 0x5e
	BOOL _eventHandledByPage;	// 95 = 0x5f
	BOOL _sleeping;	// 96 = 0x60
	BOOL _disableNowPlaying;	// 97 = 0x61
	BOOL _consoleDisplayScheduled;	// 98 = 0x62
	long _pointerRepeat;	// 100 = 0x64
	BOOL _pointerForRemote;	// 104 = 0x68
	struct {
		__unsafe_unretained NSMutableArray *all;
		__unsafe_unretained NSMutableArray *html;
		__unsafe_unretained NSMutableArray *javascript;
		__unsafe_unretained NSMutableArray *css;
		__unsafe_unretained NSMutableArray *error;
		__unsafe_unretained NSMutableArray *warning;
		__unsafe_unretained NSMutableArray *tip;
		__unsafe_unretained NSMutableArray *log;
	} _messages;	// 108 = 0x6c
	NSMutableString *_consoleMessages;	// 140 = 0x8c
}
@property(assign) BOOL allowsMessaging;	// G=0x31654341; S=0x31654375; converted property
@property(assign) CGColorRef defaultBackgroundColor;	// G=0x3164fdc9; S=0x31651c85; converted property
@property(assign) id delegate;	// G=0x3164fd99; S=0x3164fda9; converted property
@property(assign) BOOL opaque;	// G=0x31650a31; S=0x31650a61; converted property
@property(readonly, retain) NSURLRequest *request;	// G=0x31650d09; converted property
@property(assign) BOOL sleeping;	// G=0x3164fdb9; S=0x31650af1; converted property
+ (void)initialize;	// 0x3165119d
+ (Class)layerClass;	// 0x31651141
+ (id)webMediaPlayerProxy;	// 0x31651161
- (id)init;	// 0x316517b9
- (id)_activeDocument;	// 0x31650091
- (BOOL)_clickOnFocusedElement:(BOOL)element;	// 0x31652bc1
- (void)_determineCursorState:(id)state;	// 0x3164ff65
- (void)_displayJavaScriptConsole;	// 0x31650279
- (id)_findContentValueForMetaTagNamed:(id)metaTagNamed metaTags:(id)tags;	// 0x3164fe91
- (void)_handleCustomEvent:(id)event;	// 0x31650121
- (BOOL)_handleFocusEvent:(id)event;	// 0x31650305
- (BOOL)_handlePageEvent:(id)event;	// 0x31652895
- (BOOL)_handlePointerClickEvent:(id)event;	// 0x31652aa9
- (BOOL)_handlePointerDirectionalEvent:(id)event;	// 0x31652e15
- (BOOL)_handlePointerEvent:(id)event;	// 0x316502b1
- (BOOL)_handleScrollEvent:(id)event;	// 0x31652c8d
- (void)_installJSEventHandlers:(id)handlers;	// 0x3165039d
- (void)_loadProgressUpdated:(id)updated;	// 0x316509cd
- (CGSize)_minimumPageSize;	// 0x31653375
- (CGPoint)_mousePointForElement:(id)element;	// 0x3165125d
- (id)_newFocusForEvent:(id)event;	// 0x316512f1
- (void)_nextRunLoopDisplayJavaScriptConsole;	// 0x31650221
- (void)_processMetaTagsForWebView:(id)webView;	// 0x31653459
- (CGRect)_safeContentRect;	// 0x316527ad
- (CGPoint)_scrollPoint;	// 0x316513a1
- (void)_scrollToPointOnPage:(CGPoint)pointOnPage;	// 0x316535fd
- (void)_scrollToRectOnPage:(CGRect)rectOnPage;	// 0x31652609
- (void)_setLayoutComplete:(BOOL)complete;	// 0x3165055d
- (void)_updateControls;	// 0x316504e1
- (void)_updateDefaultFocus;	// 0x31653181
- (void)_webControlDidReceiveMessage:(id)_webControl;	// 0x31652229
- (void)_webView:(id)view didFailLoadWithError:(id)error forFrame:(id)frame provisional:(BOOL)provisional;	// 0x31650185
- (void)_webviewSizeChanged:(id)changed;	// 0x3165211d
- (void)addInputString:(id)string;	// 0x31650665
// converted property getter: - (BOOL)allowsMessaging;	// 0x31654341
- (BOOL)brEventAction:(id)action;	// 0x31650f25
- (BOOL)brKeyEvent:(id)event;	// 0x31650ebd
- (BOOL)canGoBack;	// 0x31650c19
- (BOOL)canGoForward;	// 0x31650be9
- (void)clearMessagesMatchingMask:(int)mask;	// 0x3165412d
- (void)close;	// 0x31650a11
- (CGPoint)contentsPointForWebView:(id)webView;	// 0x316514f1
- (void)controlWasActivated;	// 0x31651079
- (void)controlWasDeactivated;	// 0x31650fb5
- (void)dealloc;	// 0x31651ca9
// converted property getter: - (CGColorRef)defaultBackgroundColor;	// 0x3164fdc9
// converted property getter: - (id)delegate;	// 0x3164fd99
- (void)deleteFromInput;	// 0x3165062d
- (BOOL)deliverKeypress:(int)keypress;	// 0x31652029
- (CGRect)documentVisibleRectForWebView:(id)webView;	// 0x31651485
- (double)estimatedProgress;	// 0x31650b89
- (void)focusedElementChangedTo:(id)to forWindow:(id)window;	// 0x31652a25
- (id)generateSnapshot;	// 0x31651ef9
- (void)goBack;	// 0x31650c79
- (void)goForward;	// 0x31650c49
- (void)handleKeypressEvent:(id)event;	// 0x316520e9
- (void)layoutSubcontrols;	// 0x31653731
- (void)loadRequest:(id)request;	// 0x31650d71
- (BOOL)loading;	// 0x31650bb9
- (id)messagesMatchingMask:(int)mask;	// 0x31654061
// converted property getter: - (BOOL)opaque;	// 0x31650a31
- (id)preferredActionForKey:(id)key;	// 0x31650a95
- (void)reload;	// 0x31650cd9
// converted property getter: - (id)request;	// 0x31650d09
// converted property setter: - (void)setAllowsMessaging:(BOOL)messaging;	// 0x31654375
// converted property setter: - (void)setDefaultBackgroundColor:(CGColorRef)color;	// 0x31651c85
// converted property setter: - (void)setDelegate:(id)delegate;	// 0x3164fda9
// converted property setter: - (void)setOpaque:(BOOL)opaque;	// 0x31650a61
// converted property setter: - (void)setSleeping:(BOOL)sleeping;	// 0x31650af1
- (void)setString:(id)string;	// 0x31650e7d
// converted property getter: - (BOOL)sleeping;	// 0x3164fdb9
- (void)stopLoading;	// 0x31650ca9
- (id)stringValue;	// 0x31650e9d
- (id)title;	// 0x31650b59
- (void)webView:(id)view attachRootLayer:(id)layer;	// 0x316506d5
- (void)webView:(id)view decidePolicyForNewWindowAction:(id)newWindowAction request:(id)request newFrameName:(id)name decisionListener:(id)listener;	// 0x316500cd
- (void)webView:(id)view didCommitLoadForFrame:(id)frame;	// 0x31653635
- (void)webView:(id)view didFailLoadWithError:(id)error forFrame:(id)frame;	// 0x31650771
- (void)webView:(id)view didFailProvisionalLoadWithError:(id)error forFrame:(id)frame;	// 0x31650745
- (void)webView:(id)view didFinishLoadForFrame:(id)frame;	// 0x3165079d
- (void)webView:(id)view didFirstVisuallyNonEmptyLayoutInFrame:(id)frame;	// 0x31650855
- (void)webView:(id)view didReceiveMessage:(id)message;	// 0x316543a9
- (void)webView:(id)view didReceiveTitle:(id)title forFrame:(id)frame;	// 0x316508ad
- (void)webView:(id)view didStartProvisionalLoadForFrame:(id)frame;	// 0x3165093d
- (id)webView:(id)view plugInViewWithArguments:(id)arguments fromPlugInPackage:(id)package;	// 0x3165071d
- (void)webView:(id)view resource:(id)resource didCancelAuthenticationChallenge:(id)challenge fromDataSource:(id)dataSource;	// 0x3164fddd
- (void)webView:(id)view resource:(id)resource didReceiveAuthenticationChallenge:(id)challenge fromDataSource:(id)dataSource;	// 0x316523e1
- (void)webView:(id)view restoreStateFromHistoryItem:(id)historyItem forFrame:(id)frame force:(BOOL)force;	// 0x3165156d
- (id)webView:(id)view runJavaScriptTextInputPanelWithPrompt:(id)prompt defaultText:(id)text initiatedByFrame:(id)frame;	// 0x3164fdd9
- (void)webView:(id)view saveStateToHistoryItem:(id)historyItem forFrame:(id)frame;	// 0x31651689
- (BOOL)webView:(id)view shouldScrollToPoint:(CGPoint)point forFrame:(id)frame;	// 0x316513ed
- (void)webViewDidLayout:(id)webView;	// 0x3165069d
@end

