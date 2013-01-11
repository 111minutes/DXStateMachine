//
//  DXViewController.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/26/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXViewController.h"
#import "DXStateMachine.h"
#import "DXStateMachineProtocol.h"

@interface DXViewController () <DXStateMachineProtocol>

@end

@implementation DXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    configureStateMachine(self, ^(DXStateMachine *stateMachine) {
        [stateMachine addState:@"initial" transitionTo:@"second"];
        [stateMachine addState:@"third"];
        [stateMachine addTransitionFrom:@"initial" to:@"third"];

        [stateMachine afterState:@"initial"
                              do:^(NSString *state) {
                                  NSLog(@"did change state from %@", state);
                              }];
        
        [stateMachine beforeState:@"third"
                               do:^(NSString *state) {
                                   NSLog(@"will set %@ state", state);
                               }];
    });

    self.state = @"initial";
    [self setState:@"third"];
}

@end
