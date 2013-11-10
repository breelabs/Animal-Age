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
#ifdef WEBSITE
#import <Sparkle/Sparkle.h>
#endif
@interface AppDelegate : NSObject <NSApplicationDelegate>

{
    IBOutlet id TxtShddow; 
    IBOutlet id TxtShddow2; 
    IBOutlet id TxtShddow3;
    IBOutlet id MainWindow;
    IBOutlet id CalcText;
    IBOutlet id arrowImage;
    IBOutlet id aButton;
    IBOutlet id graphView;
}

@property (assign) IBOutlet INAppStoreWindow *window;
@property (assign) IBOutlet NSPopover *popover;
@property (assign) IBOutlet NSPopover *popcalc;
- (IBAction)showPopup:(id)sender;
- (IBAction)showCalc:(id)sender;
@end
