//
//  Dog.m
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(IBAction)calculateAnswer:(id)sender

{ 
    float num1, type, answer, y;
    
    NSInteger indexInteger = [typeField indexOfSelectedItem];
    
    num1 = [numberField floatValue];
    type = [typeField floatValue];

// Dog Calculation
    
    if(indexInteger == 0) {
    
        if (num1 <= 0) {
            
            answer = 0;
            [alertField setStringValue:@"Please enter a value between 0 and 200 yrs."];
            
            [NSApp beginSheet:errorSheet modalForWindow:MainWindow 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 > 200) {
            
            answer = 0;
            [numberField setStringValue:@"1"];
            [alertField setStringValue:@"Please enter a value between 0 and 200 yrs."];
            [NSApp beginSheet:errorSheet modalForWindow:MainWindow 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
    
            
        } else {
            
            y = ((num1>=21) ? ((num1-21)/4+2) : (num1/10.5));
            answer = (y * 10)/10; 
            [webView stringByEvaluatingJavaScriptFromString: @"loadDogData()" ];

        }

// Cat Calulation
        
    } else if(indexInteger == 1) {
        
        if (num1 <= 0) {
            
            answer = 0;
            [alertField setStringValue:@"Please enter a value between 0 and 200 yrs."];
            [NSApp beginSheet:errorSheet modalForWindow:MainWindow 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 > 200) {
            
            answer = 0;
            [numberField setStringValue:@"1"];
            [alertField setStringValue:@"Please enter a value between 0 and 200 yrs."];
            [NSApp beginSheet:errorSheet modalForWindow:MainWindow 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 <= 0.5) {
            
            answer = round((num1 * 26)*100)/100;
            [webView stringByEvaluatingJavaScriptFromString: @"loadCatData()" ];
            
        } else {
            
            answer = 13;
            if (num1 <= 1) {
                answer = round((answer + (num1 - 0.5) * 16)*100)/100;
                [webView stringByEvaluatingJavaScriptFromString: @"loadCatData()" ];
                
            } else {
                
                answer = answer + 8;
                
                if (num1 < 2) {
                    answer = round((answer + (num1 - 1) * 10)*100)/100;
                    [webView stringByEvaluatingJavaScriptFromString: @"loadCatData()" ];
                    
                } else {
                    answer = round((answer + 10 + (num1 - 2) * 3)*100)/100;
                    [webView stringByEvaluatingJavaScriptFromString: @"loadCatData()" ];
                }
                
            }
        }

// Cow Calulation
        
    } else if(indexInteger == 2) {
        
        if (num1 <= 0) {
            
            answer = 0;
            [alertField setStringValue:@"Please enter a value between 0 and 200 yrs."];
            [NSApp beginSheet:errorSheet modalForWindow:MainWindow 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 > 200) {
            
            answer = 0;
            [numberField setStringValue:@"1"];
            [alertField setStringValue:@"Please enter a value between 0 and 200 yrs."];
            [NSApp beginSheet:errorSheet modalForWindow:MainWindow 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else {
            
            answer = num1 * 0.15;
            [webView stringByEvaluatingJavaScriptFromString: @"loadCowData()" ];
        } 
        
    }

NSNumberFormatter *answerFormatter = [[[NSNumberFormatter alloc] init] autorelease];
[answerFormatter setFormat: @"#,###.0;0.0;(#,##0.0)"];
[[answerField cell] setFormatter:answerFormatter];
[answerField setFloatValue:answer];
    
}

- (IBAction)isError:(id)sender
{
    [NSApp beginSheet:errorSheet modalForWindow:MainWindow modalDelegate:self didEndSelector:NULL contextInfo:nil];
	
}

- (IBAction)doneError:(id)sender
{
	[errorSheet orderOut:nil];
    [NSApp endSheet:errorSheet];
	
}

- (IBAction)changeOperation:(id)sender {
    [typeField selectItemAtIndex:[sender tag]];
    
    long operation;
    
    operation = [typeField selectedTag];
    
    switch (operation) {
        case 0:
            [CalcText setStringValue:@"Dog Age"];
            NSImage *dogIcon = [NSImage imageNamed:@"dog-icon.png"];
            [aButton setImage: dogIcon] ;
            [aButton setAlternateImage: dogIcon] ;
            break;
        case 1:
            [CalcText setStringValue:@"Cat Age"];
            NSImage *catIcon = [NSImage imageNamed:@"cat-icon.png"];
            [aButton setImage: catIcon] ;
            [aButton setAlternateImage: catIcon] ;
            break;
        case 2:
            [CalcText setStringValue:@"Cow Age"];
            NSImage *cowIcon = [NSImage imageNamed:@"cow-icon.png"];
            [aButton setImage: cowIcon] ;
            [aButton setAlternateImage: cowIcon] ;
            break;
    }
    [self calculateAnswer:sender];
}
@end