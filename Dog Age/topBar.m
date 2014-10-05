//
//  topBar.m
//  Dog Age
//
//  Created by Jon Brown on 1/12/12.
//  Copyright (c) 2012 JBD. All rights reserved.
//

#import "topBar.h"

@implementation topBar

// Automatically create accessor methods
@synthesize startingColor;
@synthesize endingColor;
@synthesize angle;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setStartingColor:[NSColor colorWithCalibratedWhite:1.0 alpha:1.0]];
        [self setEndingColor:nil];
        [self setAngle:270];
    }
    return self;
}

- (void)drawRect:(NSRect)aRect
{
    [[NSColor colorWithDeviceRed:0.679 green:0.679 blue:0.679 alpha:1.0]  set];
    NSRectFill([self bounds]);
}


@end
