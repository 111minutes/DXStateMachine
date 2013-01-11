//
//  DXStateMachineAdditions.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/26/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateConfigurator.h"
#import "DXStateMachineAdditions.h"
#import "DXStateMachine.h"
#import "DXStateMachineProtocol.h"
#import "DXStateDefines.h"
#import <objc/runtime.h>

void configureStateMachine(id object, DXStateMachineConfigurationBlock configurationBlock)
{
    [[DXStateConfigurator shared] configureObject:object withStateMachineConfigureBlock:[configurationBlock copy]];
}

DXStateMachine *stateMachineForObject(id object)
{
    DXStateMachine *associatedStateMachine = (DXStateMachine *)objc_getAssociatedObject(object, kStateMachineAssociationKey);
    
    assert(associatedStateMachine);
    
    return associatedStateMachine;
}

DXStateMachine *DXStateMachineImplementation(id self, SEL _cmd)
{
    return stateMachineForObject(self);
}

void DXSetStateImplementation(id self, SEL _cmd, NSString *state)
{
    [stateMachineForObject(self) performSelector:@selector(setStateName:) withObject:[state copy]];
}

NSString *DXGetStateImplementation(id self, SEL _cmd)
{
    return [stateMachineForObject(self) performSelector:@selector(stateName) withObject:nil];;
}
