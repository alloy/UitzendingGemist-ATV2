//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "BRFocusContainer.h"
#import "BRResponder.h"

@class CALayer, NSArray, NSMutableArray, NSObject<BREventDelegate>;

@interface BRControl : NSObject <BRFocusContainer, BRResponder>
{
    CALayer *_backing;
    BRControl *_defaultFocus;
    BRControl *_focusedControl;
    BRControl *_previousFocus;
    BRControl *_keyEventTargetControl;
    unsigned int _autoresizing;
    NSMutableArray *_subControls;
    BOOL _dontAutoresizeSubviews;
    BOOL _acceptsFocus;
    BOOL _focused;
    BOOL _controlActive;
    BOOL _inhibitsFocusForChildren;
    BOOL _inhibitsScrollFocusForChildren;
    NSObject<BREventDelegate> *_brEventDelegate;
    BOOL _focusByDirectionEnabled;
    BOOL _ignoreDirectionalInfoForFocus;
}

+ (id)control;
+ (id)controlWithScaledFrame:(struct CGRect)arg1;
+ (Class)layerClass;
- (void)_axPrintSubviews:(int)arg1 string:(id)arg2;
- (id)_axSubviews;
- (id)_axSuperviews;
- (BOOL)_changeFocusTo:(id)arg1;
- (void)_dumpControlTree;
- (void)_dumpFocusTree;
- (BOOL)_focusControlTreeForEvent:(id)arg1 nearPoint:(struct CGPoint)arg2;
- (BOOL)_focusControlTreeWithDefaults;
- (id)_focusedLeafControl;
- (struct CGPoint)_focusedPointForEvent:(id)arg1;
- (id)_initialFocus;
- (void)_insertSingleControl:(id)arg1 atIndex:(long)arg2;
- (id)_parentScrollControl;
- (void)_reevaluateFocusTree;
- (void)_removeAllControls;
- (void)_removeControl:(id)arg1;
- (void)_resizeSubviewsWithOldSize:(struct CGSize)arg1;
- (void)_resizeWithOldSuperviewSize:(struct CGSize)arg1;
- (void)_scrollPoint:(struct CGPoint)arg1 fromControl:(id)arg2;
- (void)_scrollRect:(struct CGRect)arg1 fromControl:(id)arg2;
- (void)_scrollingCompleted;
- (void)_scrollingInitiated;
- (void)_setControlFocused:(BOOL)arg1;
- (void)_setFocus:(id)arg1;
- (struct CGRect)_visibleRectOfControl:(id)arg1;
- (void)_visibleScrollRectChanged;
- (BOOL)acceptsFocus;
- (id)accessibilityAncestor:(Class)arg1;
- (id)accessibilityControls;
- (BOOL)accessibilityElementIsHidden;
- (BOOL)accessibilityIsDescendant:(id)arg1;
@property(nonatomic) BOOL accessibilityOutputsRangeForChildren;
- (id)actionForKey:(id)arg1;
- (id)actionForLayer:(id)arg1 forKey:(id)arg2;
- (id)actions;
- (BOOL)active;
- (void)addAnimation:(id)arg1 forKey:(id)arg2;
- (void)addControl:(id)arg1;
- (struct CGAffineTransform)affineTransform;
- (struct CGPoint)anchorPoint;
- (id)animationForKey:(id)arg1;
- (unsigned int)autoresizingMask;
- (BOOL)avoidsCursor;
- (struct CGColor *)backgroundColor;
- (id)badge;
- (struct CGColor *)borderColor;
- (float)borderWidth;
- (struct CGRect)bounds;
- (struct CGSize)boundsForFocusCandidate:(id)arg1;
- (BOOL)brEventAction:(id)arg1;
- (BOOL)brKeyEvent:(id)arg1;
- (int)contentMode;
- (struct CGAffineTransform)contentModeTransformForSize:(struct CGSize)arg1;
- (long)controlCount;
- (void)controlDidDisplayAsModalDialog;
- (id)controlForPoint:(struct CGPoint)arg1;
- (void)controlWasActivated;
- (void)controlWasDeactivated;
- (void)controlWasFocused;
- (void)controlWasUnfocused;
- (id)controls;
- (struct CGPoint)convertPoint:(struct CGPoint)arg1 fromControl:(id)arg2;
- (struct CGPoint)convertPoint:(struct CGPoint)arg1 toControl:(id)arg2;
- (struct CGRect)convertRect:(struct CGRect)arg1 fromControl:(id)arg2;
- (struct CGRect)convertRect:(struct CGRect)arg1 toControl:(id)arg2;
- (void)dealloc;
- (id)debugDescriptionForFocusCandidate:(id)arg1;
- (id)defaultFocus;
- (void)drawInContext:(struct CGContext *)arg1;
- (void)drawLayer:(id)arg1 inContext:(struct CGContext *)arg2;
- (BOOL)eligibilityForFocusCandidate:(id)arg1;
@property(retain) NSObject<BREventDelegate> *eventDelegate; // @synthesize eventDelegate=_brEventDelegate;
- (id)firstControlNamed:(id)arg1;
- (id)focusCandidates;
- (struct CGRect)focusCursorFrame;
- (id)focusObjectForCandidate:(id)arg1;
- (id)focusedControl;
- (id)focusedControlForEvent:(id)arg1 focusPoint:(struct CGPoint *)arg2;
- (struct CGRect)frame;
- (BOOL)handlePlayButton:(id)arg1;
- (id)identifier;
@property(nonatomic) BOOL ignoreDirectionalInfoForFocus; // @synthesize ignoreDirectionalInfoForFocus=_ignoreDirectionalInfoForFocus;
- (id)inheritedValueForKey:(id)arg1;
- (BOOL)inhibitsFocusForChildren;
- (BOOL)inhibitsScrollFocusForChildren;
- (id)init;
- (id)initWithLayout:(id)arg1;
- (id)initialFocus;
- (void)insertControl:(id)arg1 above:(id)arg2;
- (void)insertControl:(id)arg1 atIndex:(long)arg2;
- (void)insertControl:(id)arg1 below:(id)arg2;
- (BOOL)isFocused;
- (BOOL)isHidden;
- (id)keyEventTargetControl;
- (id)layer;
- (id)layerForBacking;
- (void)layoutSubcontrols;
- (void)layoutSublayersOfLayer:(id)arg1;
- (void)mapDataObject:(id)arg1 withMappings:(id)arg2;
- (BOOL)masksToBounds;
- (id)name;
- (id)object;
- (float)opacity;
- (id)parent;
- (id)parentScrollControl;
- (struct CGPoint)position;
- (struct CGPoint)positionForFocusCandidate:(id)arg1;
- (id)preferredActionForKey:(id)arg1;
- (float)preferredCursorRadius;
- (void)removeAllAnimations;
- (void)removeAnimationForKey:(id)arg1;
- (void)removeFromParent;
- (id)root;
- (struct CGPoint)scrollControl:(id)arg1 adjustScrollPosition:(struct CGPoint)arg2;
- (void)scrollPoint:(struct CGPoint)arg1;
- (void)scrollRectToVisible:(struct CGRect)arg1;
- (void)scrollingCompleted;
- (void)scrollingInitiated;
- (id)selectionHandler;
- (void)setAcceptsFocus:(BOOL)arg1;
- (void)setActions:(id)arg1;
- (void)setAffineTransform:(struct CGAffineTransform)arg1;
- (void)setAnchorPoint:(struct CGPoint)arg1;
- (void)setAutoresizingMask:(unsigned int)arg1;
- (void)setAvoidsCursor:(BOOL)arg1;
- (void)setBackgroundColor:(struct CGColor *)arg1;
- (void)setBorderColor:(struct CGColor *)arg1;
- (void)setBorderWidth:(float)arg1;
- (void)setBounds:(struct CGRect)arg1;
- (void)setContentMode:(int)arg1;
- (void)setControls:(id)arg1;
- (void)setDefaultFocus:(id)arg1;
- (void)setDefaultFocusWithPoint:(struct CGPoint)arg1;
- (BOOL)setFocusToGlyphNamed:(id)arg1;
- (void)setFocusedControl:(id)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)setHidden:(BOOL)arg1;
- (void)setIdentifier:(id)arg1;
- (void)setInhibitsFocusForChildren:(BOOL)arg1;
- (void)setInhibitsScrollFocusForChildren:(_Bool)arg1;
- (void)setKeyEventTargetControl:(id)arg1;
- (void)setMasksToBounds:(BOOL)arg1;
- (void)setName:(id)arg1;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(struct CGRect)arg1;
- (void)setNeedsLayout;
- (void)setObject:(id)arg1;
- (void)setOpacity:(float)arg1;
- (void)setPosition:(struct CGPoint)arg1;
- (void)setSelectionHandler:(id)arg1;
@property(copy, nonatomic) NSArray *subcontrols;
- (void)setValue:(id)arg1 forKey:(id)arg2 cascade:(BOOL)arg3;
- (void)setValue:(id)arg1 forUndefinedKey:(id)arg2;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)sizeToFit;
- (int)touchSensitivity;
- (id)valueForUndefinedKey:(id)arg1;
- (struct CGRect)visibleScrollRect;
- (void)visibleScrollRectChanged;
- (void)windowMaxBoundsChanged;

@end

