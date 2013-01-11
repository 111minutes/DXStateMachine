//
//  DXStateMachineProtocol.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/26/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

@class DXStateMachine;

@protocol DXStateMachineProtocol <NSObject>

@optional
@property (nonatomic, strong, getter = state, setter = setState:) NSString *state;

@end
