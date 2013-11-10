//
//  WindowController.m
//  Dog Age
//
//  Created by Jon Brown on 2/25/13.
//  Copyright (c) 2013 JBD. All rights reserved.
//

#import "WindowController.h"
#import "INAppStoreWindow.h"

@implementation WindowController

- (void)windowDidLoad
{
    [super windowDidLoad];
    // The class of the window has been set in INAppStoreWindow in Interface Builder
    INAppStoreWindow *aWindow = (INAppStoreWindow*)[self window];
    aWindow.titleBarHeight = 40.0;
	aWindow.trafficLightButtonsLeftMargin = 13.0;
    aWindow.titleBarDrawingBlock = ^(BOOL drawsAsMainWindow, CGRect drawingRect, CGPathRef clippingPath) {
        CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
        CGContextAddPath(ctx, clippingPath);
        CGContextClip(ctx);
        
        NSGradient *gradient = nil;
        if (drawsAsMainWindow) {
            gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedRed:0 green:0.319 blue:1 alpha:1]
                                                     endingColor:[NSColor colorWithCalibratedRed:0 green:0.627 blue:1 alpha:1]];
            [[NSColor darkGrayColor] setFill];
        } else {
            // set the default non-main window gradient colors
            gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.851f alpha:1]
                                                     endingColor:[NSColor colorWithCalibratedWhite:0.929f alpha:1]];
            [[NSColor colorWithCalibratedWhite:0.6f alpha:1] setFill];
        }
        [gradient drawInRect:drawingRect angle:90];
        NSRectFill(NSMakeRect(NSMinX(drawingRect), NSMinY(drawingRect), NSWidth(drawingRect), 1));
    };
    
    // NSView *titleBarView = aWindow.titleBarView;
}



@end
