//
//  TKDropDownButton.h
//  MMTabBarView
//
//  Created by Antoine Duchateau on 8/07/15.
//  Copyright (c) 2015 Michael Monscheuer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface TKDropDownButton : NSSegmentedControl

- (BOOL)mouseHovered;

- (void) setImage:(NSImage*) value;
- (void) setAlternateImage:(NSImage*) value;
- (void) setRolloverImage:(NSImage*) value;
- (void) setTitle:(NSString*) value;
- (void) setImagePosition:(NSCellImagePosition) value;
- (void) setBordered:(BOOL) value;
- (void) setBezelStyle:(NSBezelStyle) value;
- (void) setMenu:(NSMenu*) value;
@end
