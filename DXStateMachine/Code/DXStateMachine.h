//
//  DXStateMachine.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateMachineAdditions.h"

@interface DXStateMachine : NSObject

@property (nonatomic, strong) NSString *state;

- (void)addState:(NSString*)state transitionFrom:(NSString*)from to:(NSString*)to;

@end
