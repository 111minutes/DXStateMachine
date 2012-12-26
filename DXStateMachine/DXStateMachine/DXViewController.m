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
        [stateMachine addState:@"state"
                transitionFrom:@"lol"
                            to:@"f"];
    });

    [self setState:@"state"];
    [self setState:@"f"];
}

@end
