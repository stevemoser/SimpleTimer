//
//  SMViewController.m
//  SimpleTimer
//
//  Created by Steve Moser on 8/2/12.
//  Copyright (c) 2012 Steve Moser. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController ()
@property NSTimer *timer;
@property NSTimer *secondTimer;
@end

@implementation SMViewController
@synthesize timePicker;
@synthesize timerLabel = _timerLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setTimePicker:nil];
    [self setTimerLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)touchDown:(id)sender {
    if ([self timer] != nil) {
        [self stopTimers];
    }
    
}

- (IBAction)valueChanged:(id)sender {
    UIDatePicker* datePicker = (UIDatePicker *) sender;
    
    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:[datePicker countDownDuration]
                                                        target:self
                                                      selector:@selector(timerFired)
                                                      userInfo:nil
                                                       repeats:YES]];
    
    [self setSecondTimer:[NSTimer scheduledTimerWithTimeInterval:1.0
                                                          target:self
                                                        selector:@selector(updateSecondTimer)
                                                        userInfo:nil
                                                         repeats:YES]];
}

- (void)timerFired
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Timer Done" message:nil delegate:nil cancelButtonTitle:@"OK"       otherButtonTitles:nil];
    [alert show];
    [self stopTimers];
}

- (void)updateSecondTimer
{
    NSTimeInterval duration = [[self timePicker] countDownDuration];
    int minutes = floor(duration/60);
    int seconds = trunc(duration - minutes * 60);
    
    NSString *timeString=[NSString stringWithFormat:@"%i:%02i", minutes, seconds];
    [[self timerLabel] setText:timeString];
    
    [[self timePicker] setCountDownDuration:([[self timePicker] countDownDuration]-1)];
}

- (void)stopTimers
{
    [[self timer] invalidate];
    [[self secondTimer] invalidate];
    [self setTimer:nil];
    [self setSecondTimer:nil];
}

@end
