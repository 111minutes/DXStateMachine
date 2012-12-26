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

@property (nonatomic, strong) NSMutableArray *states;
@property (nonatomic, strong) NSMutableArray *transitions;

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

- (DXState*)stateForStateName:(NSString*)stateName
{
    for (DXState *state in self.states) {
        if ([state.name isEqualToString:stateName]) {
            return state;
        }
    }
    
    return nil;
}

- (void)addState:(NSString*)stateName transitionFrom:(NSString*)from to:(NSString*)to
{
    if (![self stateForStateName:stateName]) {
        
        DXStateTransition *transition = [DXStateTransition transitionFrom:from to:to];
        
        DXState *state = [DXState stateWithName:stateName transition:transition];
        
        [self.states addObject:state];
    }
}

@end
