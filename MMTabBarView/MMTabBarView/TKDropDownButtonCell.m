//
//  TKDropDownButtonCell.m
//  MMTabBarView
//
//  Created by Antoine Duchateau on 8/07/15.
//  Copyright (c) 2015 Michael Monscheuer. All rights reserved.
//

#import "TKDropDownButtonCell.h"

@implementation TKDropDownButtonCell
@synthesize mouseHovered, rolloverImage, alternateImage, simulateClickOnMouseHovered;

- (void)addTrackingAreasForView:(NSView *)controlView inRect:(NSRect)cellFrame withUserInfo:(NSDictionary *)userInfo mouseLocation:(NSPoint)mouseLocation {
    NSTrackingAreaOptions options = 0;
    BOOL mouseIsInside = NO;
    NSTrackingArea *area = nil;
        
    options = NSTrackingEnabledDuringMouseDrag | NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways;
    
    mouseIsInside = [controlView mouse:mouseLocation inRect:cellFrame];
    if (mouseIsInside) {
        options |= NSTrackingAssumeInside;
        self.mouseHovered = YES;
    }
    
    // We make the view the owner, and it delegates the calls back to the cell after it is properly setup for the corresponding row/column in the outlineview
    area = [[NSTrackingArea alloc] initWithRect:cellFrame options:options owner:controlView userInfo:userInfo];
    [controlView addTrackingArea:area];
    [area release], area = nil;
}

- (void)mouseEntered:(NSEvent *)event {
    if (self.simulateClickOnMouseHovered && [event modifierFlags] & NSAlternateKeyMask) {
        [self performClick:self];
        return;
    }
    self.mouseHovered = YES;
    [(NSControl *)[self controlView] updateCell:self];
}

- (void)mouseExited:(NSEvent *)event {
    self.mouseHovered = NO;
    [(NSControl *)[self controlView] updateCell:self];
}


- (void) drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    NSRect imageFrame = NSMakeRect(0, 0, MIN(cellFrame.size.width, cellFrame.size.height), MIN(cellFrame.size.width, cellFrame.size.height));
    
    imageFrame = NSOffsetRect(imageFrame, (cellFrame.size.width - imageFrame.size.width)/2, (cellFrame.size.height - imageFrame.size.height)/2);
    
    if (self.mouseHovered && ![self isHighlighted]) {
        if (self.rolloverImage) {
            [self.rolloverImage drawInRect:imageFrame];
            return;
        }
    }
    
    [(([self isHighlighted] && self.alternateImage) ? self.alternateImage:self.image) drawInRect:imageFrame];
}

@end
