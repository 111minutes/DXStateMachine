//
//  DXStateMachineAdditions.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/26/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateDefines.h"

@class DXStateMachine;

void configureStateMachine(id object, DXStateMachineConfigurationBlock configurationBlock);

DXStateMachine *DXStateMachineImplementation(id self, SEL _cmd);
void DXSetStateImplementation(id self, SEL _cmd, NSString *state);
NSString *DXGetStateImplementation(id self, SEL _cmd);