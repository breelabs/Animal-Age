//
//  AppDelegate.m
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize popover, popcalc;

- (IBAction)showPopup:(id)sender {
    
    [[self popover] showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
}

- (IBAction)showCalc:(id)sender {
    
    [[self popcalc] showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
return YES;
}

- (void)awakeFromNib {      
NSString *path1 = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
NSString *html = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
[[[graphView mainFrame] frameView] setAllowsScrolling:NO];
[[graphView mainFrame] loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
[graphView setDrawsBackground:NO]; 
   
[MainWindow setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"winback.png"]]];
[graphView setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"winback.png"]]];
    
NSImage *arrows = [NSImage imageNamed:@"arrows.png"];

[arrowImage setImage: arrows];
    
NSImage *dogIcon = [NSImage imageNamed:@"dog-icon.png"];
[aButton setImage: dogIcon] ;
[aButton setAlternateImage: dogIcon] ;
    
[[TxtShddow cell] setBackgroundStyle:NSBackgroundStyleRaised];
[[TxtShddow2 cell] setBackgroundStyle:NSBackgroundStyleRaised];
[[TxtShddow3 cell] setBackgroundStyle:NSBackgroundStyleRaised];
[CalcText setStringValue:@"Dog Age"];

}
@end
