//
//  DXStateMachineAdditions.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/26/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateMachineAdditions.h"
#import "DXStateMachine.h"
#import "DXStateMachineProtocol.h"

void configureStateMachine(id object, DXStateMachineConfigurationBlock configurationBlock)
{
    [[DXStateConfigurator shared] configureObject:object withStateMachineConfigureBlock:[configurationBlock copy]];
}
