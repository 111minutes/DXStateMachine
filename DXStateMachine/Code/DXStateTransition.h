//
//  DXStateTransition.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

@interface DXStateTransition : NSObject

@property (nonatomic, copy, readonly) NSString *to;

+ (id)transitionTo:(NSString *)to;

- (id)initTo:(NSString *)to;

@end
