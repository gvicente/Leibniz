//
//  TouchView.m
//  Leibniz
//
//  Created by Steve White on 9/10/14.
//  Copyright (c) 2014 Steve White. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

@synthesize delegate = _delegate;

- (NSPoint) tabletPointFromEvent:(NSEvent *)theEvent {
    NSRect bounds = self.bounds;
    NSPoint location = [theEvent locationInWindow];
    uint16_t x = floor(MAX(0, MIN(location.x, bounds.size.width)));
    uint16_t y = floor(MAX(0, MIN(location.y, bounds.size.height)));
    y = bounds.size.height - y;
    x = bounds.size.width - x;
    return NSMakePoint(y, x);
}

- (void) mouseDown:(NSEvent *)theEvent {
    [self.delegate tabletTouchedDownAtPoint:[self tabletPointFromEvent:theEvent]];
}

-(void)mouseDragged:(NSEvent *)theEvent {
    [self.delegate tabletDraggedToPoint:[self tabletPointFromEvent:theEvent]];
}

- (void) mouseUp:(NSEvent *)theEvent {
    [self.delegate tabletTouchedUpAtPoint:[self tabletPointFromEvent:theEvent]];
}

@end
