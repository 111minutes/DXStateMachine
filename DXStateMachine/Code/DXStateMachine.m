//
//  DXStateMachine.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateMachine.h"
#import "DXStateTransition.h"
#import "DXState.h"

@interface DXStateMachine ()

@property (nonatomic, strong) NSString *stateName;
@property (nonatomic, strong) NSMutableArray *states;
@property (nonatomic, strong) NSMutableArray *transitions;
@property (nonatomic, strong) DXState *currentState;

@end

@implementation DXStateMachine

- (id)init
{
    self = [super init];
    if (self) {
        self.states = [NSMutableArray new];
        self.transitions = [NSMutableArray new];
    }
    return self;
}

- (void)setStateName:(NSString *)stateName
{
    if ([_stateName isEqualToString:stateName]) {
        return;
    }
    
    if (_stateName) {
        NSAssert([_currentState canTransitionTo:stateName], @"can't transition from %@ to %@", _stateName, stateName);
    }
    
    _stateName = stateName;
    
    self.currentState = [self stateForStateName:_stateName];
}

- (void)setCurrentState:(DXState *)currentState
{
    if ([_currentState isEqual:currentState]) {
        return;
    }
    
    if (_currentState.afterHandler) {
        _currentState.afterHandler(_currentState.name);
    }
    
    if (currentState.beforeHandler) {
        currentState.beforeHandler(currentState.name);
    }
    
    _currentState = currentState;
}

- (DXState*)stateForStateName:(NSString*)stateName
{
    for (DXState *state in self.states) {
        if ([state.name isEqualToString:stateName]) {
            return state;
        }
    }
    
    return nil;
}

- (void)addState:(NSString *)state
{
    [self addState:state transitionTo:nil];
}

- (void)addState:(NSString*)stateName transitionTo:(NSString *)to
{
    NSAssert(![self stateForStateName:stateName], @"state already added");
    
    DXStateTransition *transition = [DXStateTransition transitionTo:to];
    
    DXState *state = [DXState stateWithName:stateName transition:transition];
    
    [self.states addObject:state];
}

- (void)addTransitionFrom:(NSString*)stateName to:(NSString*)to
{
    DXState *state = [self stateForStateName:stateName];
    
    DXState *transitionState = [self stateForStateName:to];
    
    assert(state);
    NSAssert(transitionState, @"add state %@ before adding transition to it", to);
    
    NSAssert(![state canTransitionTo:to], @"transition already added");
    
    DXStateTransition *transition = [DXStateTransition transitionTo:to];
    
    [state addTransition:transition];
}

- (void)beforeState:(NSString *)stateName do:(DXBeforeStateHandler)handler
{
    DXState *state = [self stateForStateName:stateName];
    
    state.beforeHandler = handler;
}

- (void)afterState:(NSString *)stateName do:(DXAfterStateHandler)handler
{
    DXState *state = [self stateForStateName:stateName];
    
    state.afterHandler = handler;
}

@end
