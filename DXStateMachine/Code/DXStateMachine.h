//
//  DXStateMachine.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateMachineAdditions.h"
#import "DXStateMachineProtocol.h"

@interface DXStateMachine : NSObject

- (void)addState:(NSString*)state;
- (void)addState:(NSString*)state transitionTo:(NSString*)to;
- (void)addTransitionFrom:(NSString*)stateName to:(NSString*)to;

- (void)beforeState:(NSString*)stateName do:(void (^)(NSString *state))handler;
- (void)afterState:(NSString*)stateName do:(void (^)(NSString *state))handler;

@end
