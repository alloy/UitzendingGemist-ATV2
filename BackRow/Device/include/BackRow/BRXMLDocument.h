//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRXMLNode.h"

@class BRXMLElement;

@interface BRXMLDocument : BRXMLNode
{
    BRXMLElement *_rootElement;
}

- (id)XMLData;
- (id)XMLDataWithOptions:(unsigned int)arg1;
- (void)dealloc;
- (id)elementById:(id)arg1;
- (id)init;
- (id)initWithData:(id)arg1 options:(unsigned int)arg2 error:(id *)arg3;
- (id)initWithRootElement:(id)arg1;
- (id)initWithXMLString:(id)arg1 options:(unsigned int)arg2 error:(id *)arg3;
- (id)makeElementNamed:(id)arg1;
@property(retain, nonatomic) BRXMLElement *rootElement;

@end

