//
//  TKDropDownButtonCell.h
//  MMTabBarView
//
//  Created by Antoine Duchateau on 8/07/15.
//  Copyright (c) 2015 Michael Monscheuer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TKDropDownButtonCell : NSSegmentedCell {
    BOOL simulateClickOnMouseHovered;
    BOOL mouseHovered;
    NSImage * alternateImage;
    NSImage * rolloverImage;
}

@property (assign, readwrite) BOOL simulateClickOnMouseHovered;
@property (assign, readwrite) BOOL mouseHovered;
@property (strong, readwrite) NSImage * alternateImage;
@property (strong, readwrite) NSImage * rolloverImage;

- (void)addTrackingAreasForView:(NSView *)controlView inRect:(NSRect)cellFrame withUserInfo:(NSDictionary *)userInfo mouseLocation:(NSPoint)mouseLocation;
@end
