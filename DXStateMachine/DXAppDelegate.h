//
//  DXAppDelegate.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/26/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DXViewController;

@interface DXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DXViewController *viewController;

@end
