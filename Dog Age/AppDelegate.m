//
//  AppDelegate.m
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//

#import "AppDelegate.h"
#import "WindowController.h"
#import "PFMoveApplication.h"
#import "topBar.h"
#import "UAAppReviewManager.h"

@implementation AppDelegate
@synthesize popover, popcalc, topView, view, poprevcalc;


// Setup the UA App Review Manager

+ (void)initialize {
    [AppDelegate setupUAAppReviewManager];
}

+ (void)setupUAAppReviewManager {
    // Normally, all the setup would be here.
    // But, because we are presenting a few different setups in the example,
    // The config will be in the view controllers
    //	 [UAAppReviewManager setAppID:@"364709193"]; // iBooks
    //
    // It is always best to load UAAppReviewManager as early as possible
    // because it needs to receive application life-cycle notifications,
    // so we will call a simple method on it here to load it up now.
    [UAAppReviewManager setDebug:NO];
}


// Trigger the UA App Review Manager

- (void)applicationWillBecomeActive:(NSNotification *)notification {
    [UAAppReviewManager showPromptWithShouldPromptBlock:^(NSDictionary *trackingInfo) {
        // This is the block syntx for showing prompts.
        // It lets you decide if it should be shown now or not based on
        // the UAAppReviewManager trackingInfo or any other factor.
        NSLog(@"UAAppReviewManager trackingInfo: %@", trackingInfo);
        // Don't show the prompt now, but do it from the buttons in the example app.
        return NO;
    }];
}


- (IBAction)presentStandardPrompt:(id)sender {
    
    // The AppID is the only required setup
    [UAAppReviewManager setAppID:@"717666889"]; // Pages
    
    // Debug means that it will popup on the next available change
    [UAAppReviewManager setDebug:YES];
    
    // YES here means it is ok to show, it is the only override to Debug == YES.
    [UAAppReviewManager userDidSignificantEvent:YES];
}


- (IBAction)showPopup:(id)sender {
    
    [[self popover] showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
}

- (IBAction)showCalc:(id)sender {
    
    [[self popcalc] showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    
    
}

- (IBAction)showrevCalc:(id)sender {
    
    [[self poprevcalc] showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
}


- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
     [[self->window standardWindowButton:NSWindowZoomButton] setHidden:YES];
    
    [UAAppReviewManager setAppID:@"717666889"];
    [UAAppReviewManager showPromptIfNecessary];

    
    #if WEBSITE
    
   
    
    PFMoveToApplicationsFolderIfNecessary();
    
    #endif
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
return YES;
}

- (void)awakeFromNib {

    [topView setStartingColor:
     [NSColor colorWithDeviceRed:0.84 green:0.82 blue:0.82 alpha:1.0]];
    [topView setEndingColor:
     [NSColor colorWithDeviceRed:0.47 green:0.47 blue:0.47 alpha:1.0]];
    [topView setAngle:270];
    
    
    [secondView setStartingColor:
     [NSColor colorWithDeviceRed:0.84 green:0.82 blue:0.82 alpha:1.0]];
    [secondView setEndingColor:
     [NSColor colorWithDeviceRed:0.47 green:0.47 blue:0.47 alpha:1.0]];
    [secondView setAngle:270];
    
    [view addSubview:topView];

    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"flipPref"];
    NSString*  flipin = [defaults objectForKey:@"flipPref"];
    int flipValue = [flipin doubleValue];
    
    NSLog(@"Flip Status: %d", flipValue);
    
    
NSString *path1 = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
NSString *html = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
[[[graphView mainFrame] frameView] setAllowsScrolling:NO];
[[graphView mainFrame] loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
[graphView setDrawsBackground:NO]; 
   
[window setBackgroundColor:[NSColor colorWithDeviceRed:0.74 green:0.74 blue:0.74 alpha:1.0]];
[graphView setBackgroundColor:[NSColor colorWithDeviceRed:0.74 green:0.74 blue:0.74 alpha:1.0]];
    
NSImage *arrows = [NSImage imageNamed:@"Opposite_Arrows@2x.png"];

    [arrowImage setImage: arrows];
    [arrowImage setAlternateImage: arrows] ;
    [arrowImage2 setImage: arrows];
    [arrowImage2 setAlternateImage: arrows] ;
    
//NSImage *dogIcon = [NSImage imageNamed:@"doggie.png"];
    [aButton setTitle: @"Dog"] ;
    //[aButton setAlternateImage: dogIcon] ;
    [aButton2 setTitle:@"Dog"] ;
    //[aButton2 setAlternateImage: dogIcon] ;
    
[[TxtShddow cell] setBackgroundStyle:NSBackgroundStyleRaised];
[[TxtShddow2 cell] setBackgroundStyle:NSBackgroundStyleRaised];
[[TxtShddow3 cell] setBackgroundStyle:NSBackgroundStyleRaised];
[window setTitle:@"Dog Age"];

}

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    
}

- (IBAction)isPref:(id)sender
{
    [NSApp beginSheet:prefSheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
    
}

- (IBAction)donePref:(id)sender
{
    [prefSheet orderOut:nil];
    [NSApp endSheet:prefSheet];
    
}



@end
