//
//  DXState.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

@class DXStateTransition;

@interface DXState : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) DXStateTransition *transition;

+ (id)stateWithName:(NSString*)stateName transition:(DXStateTransition*)transition;

- (id)initWithName:(NSString*)stateName transition:(DXStateTransition*)transition;

@end
