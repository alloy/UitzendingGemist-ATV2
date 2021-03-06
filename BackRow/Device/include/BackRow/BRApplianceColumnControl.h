//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

__attribute__((visibility("hidden")))
@interface BRApplianceColumnControl : BRControl
{
    id <BRAppliance> _appliance;
    BRControl *_applianceLabel;
    float _headerWidth;
    float _maxCategoryWidth;
}

- (id)accessibilityLabel;
- (void)dealloc;
- (float)headerWidth;
- (id)initWithAppliance:(id)arg1;
- (void)layoutSubcontrols;
- (float)maxCategoryWidth;
- (void)reload;
- (void)resetMaxCategoryWidth;
- (void)resetMetrics;
- (void)setMaxCategoryWidth:(float)arg1;

@end

