//
//  DXState.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

@class DXState;
@class DXStateTransition;

typedef void (^DXBeforeStateHandler)(NSString *state);
typedef void (^DXAfterStateHandler)(NSString *state);

@interface DXState : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, copy) DXBeforeStateHandler beforeHandler;
@property (nonatomic, copy) DXBeforeStateHandler afterHandler;

+ (id)stateWithName:(NSString*)stateName transition:(DXStateTransition*)transition;

- (id)initWithName:(NSString*)stateName transition:(DXStateTransition*)transition;

- (void)addTransition:(DXStateTransition *)transition;

- (BOOL)canTransitionTo:(NSString*)stateName;

@end
