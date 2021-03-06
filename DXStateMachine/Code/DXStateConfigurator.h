//
//  DXStateConfigurator.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import <DXFoundation/DXSingleton.h>
#import "DXStateDefines.h"

@class DXStateMachine;

@interface DXStateConfigurator : NSObject <DXSingleton>

- (void)configureObject:(id)object withStateMachineConfigureBlock:(DXStateMachineConfigurationBlock)block;

@end
