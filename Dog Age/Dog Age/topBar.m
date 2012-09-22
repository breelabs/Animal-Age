//
//  topBar.m
//  Dog Age
//
//  Created by Jon Brown on 1/12/12.
//  Copyright (c) 2012 JBD. All rights reserved.
//

#import "topBar.h"

@implementation topBar

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
- (void)drawRect:(NSRect)dirtyRect
{
    NSImage *pattern = [NSImage imageNamed:@"top_bar.png"];
    NSDrawThreePartImage([self bounds], pattern, pattern, pattern, NO,
                         NSCompositeSourceOver, 1, NO);
}


@end
