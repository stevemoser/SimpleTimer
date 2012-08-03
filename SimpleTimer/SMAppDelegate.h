//
//  SMAppDelegate.h
//  SimpleTimer
//
//  Created by Steve Moser on 8/2/12.
//  Copyright (c) 2012 Steve Moser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMViewController;

@interface SMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SMViewController *viewController;

@end
