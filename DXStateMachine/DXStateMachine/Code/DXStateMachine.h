//
//  DXStateMachine.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

@interface DXStateMachine : NSObject

- (void)addState:(NSString*)state transitionFrom:(NSString*)from to:(NSString*)to;

@end
