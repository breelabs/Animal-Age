//
//  AppDelegate.h
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "INAppStoreWindow.h"
#import "Dog.h"

#ifdef WEBSITE
#import <Sparkle/Sparkle.h>
#endif
@interface AppDelegate : NSObject <NSApplicationDelegate>

{
    IBOutlet id TxtShddow; 
    IBOutlet id TxtShddow2; 
    IBOutlet id TxtShddow3;
    IBOutlet id window;
    IBOutlet id CalcText;
    IBOutlet id arrowImage;
    IBOutlet id arrowImage2;
    IBOutlet id aButton;
    IBOutlet id aButton2;
    IBOutlet id graphView;


    IBOutlet id view;
    IBOutlet id topView;
    IBOutlet id secondView;
}

@property (assign) IBOutlet INAppStoreWindow *window;
@property (assign) IBOutlet NSPopover *popover;
@property (assign) IBOutlet NSPopover *popcalc;
@property (assign) IBOutlet NSPopover *poprevcalc;
@property (assign) IBOutlet NSView *topView;
@property (assign) IBOutlet NSView *view;


- (IBAction)showPopup:(id)sender;
- (IBAction)showCalc:(id)sender;
- (IBAction)showrevCalc:(id)sender;


@end
