//
//  Dog.h
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Jon Brown Designs All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>


@interface Dog : NSObject <NSApplicationDelegate>
{
    IBOutlet id answerField;
    IBOutlet id numberField;
    IBOutlet id numberField2;
    IBOutlet id typeField;
    IBOutlet id typeField2;
    
    IBOutlet id alertField;
    IBOutlet id errorSheet;
    
    IBOutlet id window;
    IBOutlet id aButton;
    IBOutlet id aButton2;
    
    IBOutlet id webView;
    IBOutlet NSProgressIndicator *myProgress;
    IBOutlet NSProgressIndicator *myProgress2;
}

@property (retain) IBOutlet NSView *topView;
@property (retain) IBOutlet NSView *view;
@property (retain) IBOutlet NSView *secondView;


- (IBAction)calculateAnswer:(id)sender;
- (IBAction)isError:(id)sender;
- (IBAction)doneError:(id)sender;
- (IBAction)changeOperation:(id)sender;
- (IBAction)changeAge:(id)sender;

- (IBAction)showflip:(id)sender;
- (IBAction)hideflip:(id)sender;




@end
