//
//  TKDropDownButton.m
//  MMTabBarView
//
//  Created by Antoine Duchateau on 8/07/15.
//  Copyright (c) 2015 Michael Monscheuer. All rights reserved.
//

#import "TKDropDownButton.h"
#import "TKDropDownButtonCell.h"

@implementation TKDropDownButton

- (id) initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        self.segmentCount = 1;
        [self setFocusRingType:NSFocusRingTypeNone];
    }
    return self;
}

- (BOOL)mouseHovered {
    return [[self cell] mouseHovered];
}

-(void)updateTrackingAreas {
    [super updateTrackingAreas];
    
    // remove all tracking rects
    for (NSTrackingArea *area in [self trackingAreas]) {
        // We have to uniquely identify our own tracking areas
        if ([area owner] == self) {
            [self removeTrackingArea:area];
        }
    }
    // force reset of mouse hovered state
    if ([self mouseHovered])
        [[self cell] mouseExited:nil];
    
    // recreate tracking areas and tool tip rects
    
    NSPoint mouseLocationInScreenCoos = [NSEvent mouseLocation];
    
    NSPoint mouseLocationInWindowCoos = [[self window] convertRectFromScreen:NSMakeRect(mouseLocationInScreenCoos.x, mouseLocationInScreenCoos.y, 0.0, 0.0)].origin;
    
    NSPoint mouseLocation = [self convertPoint:mouseLocationInWindowCoos fromView:nil];
    
    [[self cell] addTrackingAreasForView:self inRect:[self bounds] withUserInfo:nil mouseLocation:mouseLocation];
}

- (void)mouseEntered:(NSEvent *)theEvent {
    [[self cell] mouseEntered:theEvent];
}

- (void)mouseExited:(NSEvent *)theEvent {
    [[self cell] mouseExited:theEvent];
}

- (void) setImage:(NSImage*) value {
    [[self cell] setImage:value];
}
- (void) setAlternateImage:(NSImage*) value {
    [[self cell] setAlternateImage:value];
}
- (void) setRolloverImage:(NSImage*) value {
    [[self cell] setRolloverImage:value];
}
- (void) setTitle:(NSString*) value {
    [self setLabel:value forSegment:0];
}
- (void) setImagePosition:(NSCellImagePosition) value {
    
}
- (void) setBordered:(BOOL) value {
}
- (void) setBezelStyle:(NSBezelStyle) value {
}
- (void) setMenu:(NSMenu*) value {
    [self setMenu:value forSegment:0];
}

+(Class)cellClass {
    return [TKDropDownButtonCell class];
}

@end
