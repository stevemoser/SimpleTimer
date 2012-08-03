//
//  SMViewController.h
//  SimpleTimer
//
//  Created by Steve Moser on 8/2/12.
//  Copyright (c) 2012 Steve Moser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
- (IBAction)touchDown:(id)sender;
- (IBAction)valueChanged:(id)sender;

@end
