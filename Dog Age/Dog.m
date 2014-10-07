//
//  Dog.m
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Jon Brown Designs. All rights reserved.
//

#import "Dog.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation Dog

- (void)awakeFromNib {
    [myProgress setDisplayedWhenStopped:NO];
    [myProgress2 setDisplayedWhenStopped:NO];
    
    NSNumberFormatter *answerFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [answerFormatter setFormat: @"#,###;0;(#,##0)"];
    [numberField setFormatter:answerFormatter];
    [numberField2 setFormatter:answerFormatter];
    
}
-(void)dogAnswer:(NSTimer *)timer {
    [myProgress stopAnimation:self];
    [myProgress2 stopAnimation:self];
}



-(IBAction)showflip:(id)sender {
    
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = kCATransitionFromTop;
    animation.duration = 0.25f;
    animation.delegate = self;
    //animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.view setWantsLayer:YES]; // Turn on backing layer
    [self.view setAnimations:[NSDictionary dictionaryWithObject:animation forKey:@"subviews"]];
    
    [[_view animator] replaceSubview:_topView with:_secondView];
    
    [_secondView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [_secondView setNeedsDisplay:YES];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"flipPref"];
    NSString*  flipin = [defaults objectForKey:@"flipPref"];
    int flipValue = [flipin doubleValue];
    
    NSLog(@"Flip Status: %d", flipValue);
    
    [myProgress startAnimation:self];
    [myProgress2 startAnimation:self];
    [self performSelector:@selector(dogAnswer:) withObject:nil afterDelay:.15];
    [self calculateAnswer:sender];
    
}

-(IBAction)hideflip:(id)sender {
    
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = kCATransitionFromBottom;
    animation.duration = 0.25f;
    animation.delegate = self;
    //animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.view setWantsLayer:YES]; // Turn on backing layer
    [self.view setAnimations:[NSDictionary dictionaryWithObject:animation forKey:@"subviews"]];
    
    
    [[_view animator] replaceSubview:_secondView with:_topView];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"flipPref"];
    NSString*  flipin = [defaults objectForKey:@"flipPref"];
    int flipValue = [flipin doubleValue];
    
    NSLog(@"Flip Status: %d", flipValue);
    
    [myProgress startAnimation:self];
    [myProgress2 startAnimation:self];
    [self performSelector:@selector(dogAnswer:) withObject:nil afterDelay:.15];
    [self calculateAnswer:sender];
    
}




-(IBAction)calculateAnswer:(id)sender

{
    
    
    
    float num1, type, answer, y;
    
    NSInteger indexInteger = [typeField indexOfSelectedItem];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString*  flipin = [defaults objectForKey:@"flipPref"];
    int flipValue = [flipin doubleValue];
    
    if (flipValue == 1 ) {
        
        NSLog(@"Flip Status: %d", flipValue);
        num1 = [numberField2 floatValue];
        
    } else {
        
        NSLog(@"Flip Status: %d", flipValue);
        num1 = [numberField floatValue];
    }
    

    type = [typeField floatValue];

// Dog Calculation
    
    if(indexInteger == 0) {
    
        if (num1 <= 0) {
            
            answer = 0;
            [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
            
            [NSApp beginSheet:errorSheet modalForWindow:window
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 > 9999) {
            
            answer = 4;
            [numberField setStringValue:@"30"];
            [numberField2 setStringValue:@"30"];
            [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
            [NSApp beginSheet:errorSheet modalForWindow:window
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
    
            
        } else {
            
            
            
            if (flipValue == 0 ) {
                
                // People Age to Animal
                
                y = ((num1>=21) ? ((num1-21)/4+2) : (num1/10.5));
                answer = (y * 100)/100;
                
                // Perform Conversion
                
                NSString * numField1 = [[NSNumber numberWithFloat:answer] stringValue];
                [numberField2 setStringValue:numField1];
                
                // Change Label
                
                [CalcText setStringValue:@"Dog Age"];
                
            } else {
                
                // Animal Age to People
                
                y = ((num1>=2) ? (21 + ((num1 - 2) * 4)) : (num1*10.5));
                answer = (y * 100)/100;
                
                // Perform Conversion
                
                NSString * numField2 = [[NSNumber numberWithFloat:answer] stringValue];
                [numberField setStringValue:numField2];
                
                // Change Label
                
                [CalcText setStringValue:@"Human Age"];
                
            }
 
            
            [webView stringByEvaluatingJavaScriptFromString: @"loadDogData()" ];
            
            // Select Dog Popup
            
            int tagOfChoice = 0;
            [typeField selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
            [typeField2 selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];

        }

// Cat Calulation
        
    } else if(indexInteger == 1) {
        
        if (num1 <= 0) {
            
            answer = 0;
            [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
            [NSApp beginSheet:errorSheet modalForWindow:window 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 > 9999) {
            
            answer = 4;
            [numberField setStringValue:@"30"];
            [numberField2 setStringValue:@"30"];
            [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
            [NSApp beginSheet:errorSheet modalForWindow:window 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else {
            
            if (flipValue == 0 ) {
                
                // People Age to Animal
                
                
                if ((num1 >= 0) && (num1 <= 15)) {
                    
                    answer = 1;
                    
                    
                } else if ((num1 >= 16) && (num1 <= 24)) {
                    
                    answer = 2;
                    
                    
                } else {
                    answer = ((num1 - 24)/4)+(2);
                    
                }
                
                // Perform Conversion
                
                NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
                [numberField2 setStringValue:numField];
                
                // Change Label
                
                [CalcText setStringValue:@"Cat Age"];
                
            
            } else {
                
                // Animal Age to People
                
                
                if ((num1 >= 0) && (num1 <= 1)) {
                    
                    answer = 15;
                    
                    
                } else if ((num1 >= 1) && (num1 <= 2)) {
                    
                    answer = 24;
                    
                    
                } else {
                    answer = ((num1 - 2)*4)+(24);
                    
                }
                
                // Perform Conversion
                
                NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
                [numberField setStringValue:numField];
                
                // Change Label
                
                [CalcText setStringValue:@"Human Age"];
               
                
            }
            
            [webView stringByEvaluatingJavaScriptFromString: @"loadCatData()" ];
            
            // Select Cat Popup
            
            int tagOfChoice = 1;
            [typeField selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
            [typeField2 selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
 
        }

// Cow Calulation
        
    } else if(indexInteger == 2) {
        
        if (num1 <= 0) {
            
            answer = 0;
            [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
            [NSApp beginSheet:errorSheet modalForWindow:window 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else if (num1 > 9999) {
            
            answer = 4;
            [numberField setStringValue:@"30"];
            [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
            [NSApp beginSheet:errorSheet modalForWindow:window 
                modalDelegate:self didEndSelector:NULL contextInfo:nil];
            
        } else {
            
            if (flipValue == 0 ) {
                
                answer = num1 * 6;
                
                // Perform Conversion
                
                NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
                [numberField2 setStringValue:numField];
                
                // Change Label
                
                [CalcText setStringValue:@"Cow Age"];
                
            } else  {
                
                answer = num1 / 6;
                
                // Perform Conversion
                
                NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
                [numberField setStringValue:numField];
                
                // Change Label
                
                [CalcText setStringValue:@"Human Age"];
            }
            
        }
        
        [webView stringByEvaluatingJavaScriptFromString: @"loadCowData()" ];
        
        // Select Cow Popup
        
        int tagOfChoice = 2;
        [typeField selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
        [typeField2 selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
        
// Rabbit Calulation
        
    } else if(indexInteger == 3) {

    if (num1 <= 0) {

    answer = 0;
    [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
    [NSApp beginSheet:errorSheet modalForWindow:window
    modalDelegate:self didEndSelector:NULL contextInfo:nil];

    } else if (num1 > 9999) {

    answer = 4;
    [numberField setStringValue:@"30"];
    [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
    [NSApp beginSheet:errorSheet modalForWindow:window
    modalDelegate:self didEndSelector:NULL contextInfo:nil];

    } else {

    if (flipValue == 0 ) {

    answer = num1 * 9.25;

    // Perform Conversion

    NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
    [numberField2 setStringValue:numField];

    // Change Label

    [CalcText setStringValue:@"Rabbit Age"];
     
     } else  {
         
         answer = num1 / 9.25;
         
         // Perform Conversion
         
         NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
         [numberField setStringValue:numField];
         
         // Change Label
         
         [CalcText setStringValue:@"Human Age"];
     }
     
     }
     
     [webView stringByEvaluatingJavaScriptFromString: @"loadRabbitData()" ];
     
     // Select Cow Popup
     
     int tagOfChoice = 3;
     [typeField selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
     [typeField2 selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
     
// Duck Calulation
        
} else if(indexInteger == 4)  {
    
    if (num1 <= 0) {
        
        answer = 0;
        [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
        [NSApp beginSheet:errorSheet modalForWindow:window
            modalDelegate:self didEndSelector:NULL contextInfo:nil];
        
    } else if (num1 > 9999) {
        
        answer = 4;
        [numberField setStringValue:@"30"];
        [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
        [NSApp beginSheet:errorSheet modalForWindow:window
            modalDelegate:self didEndSelector:NULL contextInfo:nil];
        
    } else {
        
        if (flipValue == 0 ) {
            
            answer = num1 * 6.25;
            
            // Perform Conversion
            
            NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
            [numberField2 setStringValue:numField];
            
            // Change Label
            
            [CalcText setStringValue:@"Duck Age"];
             
             } else  {
                 
                 answer = num1 / 6.25;
                 
                 // Perform Conversion
                 
                 NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
                 [numberField setStringValue:numField];
                 
                 // Change Label
                 
                 [CalcText setStringValue:@"Human Age"];
             }
             
             }
             
             [webView stringByEvaluatingJavaScriptFromString: @"loadDuckData()" ];
             
             // Select Cow Popup
             
             int tagOfChoice = 4;
             [typeField selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
             [typeField2 selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
             
// Chicken Calulation
    
} else {
    
    if (num1 <= 0) {
        
        answer = 0;
        [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
        [NSApp beginSheet:errorSheet modalForWindow:window
            modalDelegate:self didEndSelector:NULL contextInfo:nil];
        
    } else if (num1 > 9999) {
        
        answer = 4;
        [numberField setStringValue:@"30"];
        [alertField setStringValue:@"Please enter a value between 0 and 9999 years."];
        [NSApp beginSheet:errorSheet modalForWindow:window
            modalDelegate:self didEndSelector:NULL contextInfo:nil];
        
    } else {
        
        if (flipValue == 0 ) {
            
            answer = num1 * 8.12;
            
            // Perform Conversion
            
            NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
            [numberField2 setStringValue:numField];
            
            // Change Label
            
            [CalcText setStringValue:@"Chicken Age"];
             
             } else  {
                 
                 answer = num1 / 8.12;
                 
                 // Perform Conversion
                 
                 NSString * numField = [[NSNumber numberWithFloat:answer] stringValue];
                 [numberField setStringValue:numField];
                 
                 // Change Label
                 
                 [CalcText setStringValue:@"Human Age"];
             }
             
             }
             
             [webView stringByEvaluatingJavaScriptFromString: @"loadChickenData()" ];
             
             // Select Cow Popup
             
             int tagOfChoice = 5;
             [typeField selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
             [typeField2 selectItemAtIndex:[typeField indexOfItemWithTag:tagOfChoice]];
             
             }



    
    
    

NSNumberFormatter *answerFormatter = [[[NSNumberFormatter alloc] init] autorelease];
[answerFormatter setFormat: @"#,###;0;(#,##0)"];
[[answerField cell] setFormatter:answerFormatter];
[answerField setFloatValue:answer];
    
    
    
}

- (IBAction)isError:(id)sender
{
    [NSApp beginSheet:errorSheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
	
}

- (IBAction)doneError:(id)sender
{
	[errorSheet orderOut:nil];
    [NSApp endSheet:errorSheet];
	
}

- (IBAction)changeOperation:(id)sender {
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString*  flipin = [defaults objectForKey:@"flipPref"];
    int flipValue = [flipin doubleValue];
    
    [typeField selectItemAtIndex:[sender tag]];
    
    long operation;
    
    operation = [typeField selectedTag];
    
    switch (operation) {
        case 0:
            if (flipValue == 0 ) {
                
            } else {
                [CalcText setStringValue:@"Human Age"];
            }
            //NSImage *dogIcon = [NSImage imageNamed:@"doggie.png"];
            [aButton setTitle: @"Dog"];
            //[aButton setAlternateImage: dogIcon] ;
            [aButton2 setTitle: @"Dog"];
            //[aButton2 setAlternateImage: dogIcon] ;
            break;
        case 1:
            if (flipValue == 0 ) {
                [CalcText setStringValue:@"Cat Age"];
            } else {
                [CalcText setStringValue:@"Human Age"];
            }
            //NSImage *catIcon = [NSImage imageNamed:@"cat-icon.png"];
            [aButton setTitle: @"Cat"] ;
            //[aButton setAlternateImage: catIcon] ;
            [aButton2 setTitle: @"Cat"] ;
            //[aButton2 setAlternateImage: catIcon] ;
            break;
        case 2:
            if (flipValue == 0 ) {
                [CalcText setStringValue:@"Cow Age"];
            } else {
                [CalcText setStringValue:@"Human Age"];
            }
            //NSImage *cowIcon = [NSImage imageNamed:@"cow-icon.png"];
            [aButton setTitle: @"Cow"] ;
            //[aButton setAlternateImage: cowIcon] ;
            [aButton2 setTitle: @"Cow"] ;
            //[aButton2 setAlternateImage: cowIcon] ;
            break;
        case 3:
            if (flipValue == 0 ) {
                [CalcText setStringValue:@"Rabbit Age"];
            } else {
                [CalcText setStringValue:@"Human Age"];
            }
            //NSImage *rabbitIcon = [NSImage imageNamed:@"rabbit-icon.png"];
            [aButton setTitle: @"Rabbit"] ;
           // [aButton setAlternateImage: rabbitIcon] ;
            [aButton2 setTitle: @"Rabbit"] ;
            //[aButton2 setAlternateImage: rabbitIcon] ;
            break;
        case 4:
            if (flipValue == 0 ) {
                [CalcText setStringValue:@"Duck Age"];
            } else {
                [CalcText setStringValue:@"Human Age"];
            }
            //NSImage *duckIcon = [NSImage imageNamed:@"duck-icon.png"];
             [aButton setTitle: @"Duck"] ;
            //[aButton setAlternateImage: duckIcon] ;
             [aButton2 setTitle: @"Duck"] ;
            //[aButton2 setAlternateImage: duckIcon] ;
            break;
        case 5:
            if (flipValue == 0 ) {
                [CalcText setStringValue:@"Chicken Age"];
            } else {
                [CalcText setStringValue:@"Human Age"];
            }
            //NSImage *chickenIcon = [NSImage imageNamed:@"chicken-icon.png"];
            [aButton setTitle: @"Chicken"] ;
            //[aButton setAlternateImage: chickenIcon] ;
            [aButton2 setTitle: @"Chicken"] ;
            //[aButton2 setAlternateImage: chickenIcon] ;
            break;
    }
    [myProgress startAnimation:self];
    [myProgress2 startAnimation:self];
    [self performSelector:@selector(dogAnswer:) withObject:nil afterDelay:2.6];
    [self calculateAnswer:sender];
}

- (IBAction)changeAge:(id)sender {
    
    [myProgress startAnimation:self];
    [myProgress2 startAnimation:self];
    [self performSelector:@selector(dogAnswer:) withObject:nil afterDelay:.15];
    [self calculateAnswer:sender];
    
}

@end