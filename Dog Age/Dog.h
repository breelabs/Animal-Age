//
//  Dog.h
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Jon Brown Designs All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>


@interface Dog : NSObject 
{
    IBOutlet id answerField;
    IBOutlet id numberField;
    IBOutlet id typeField;
    
    IBOutlet id alertField;
    IBOutlet id errorSheet;
    
    IBOutlet id MainWindow;
    IBOutlet id CalcText;
    IBOutlet id aButton;
    IBOutlet id webView;
    IBOutlet NSProgressIndicator *myProgress;
}
- (IBAction)calculateAnswer:(id)sender;
- (IBAction)isError:(id)sender;
- (IBAction)doneError:(id)sender;
- (IBAction)changeOperation:(id)sender;
- (IBAction)changeAge:(id)sender;
@end
