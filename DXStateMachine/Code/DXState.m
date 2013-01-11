//
//  DXState.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXState.h"
#import "DXStateTransition.h"

@interface DXState ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *transitions;

@end

@implementation DXState

+ (id)stateWithName:(NSString*)stateName transition:(DXStateTransition*)transition
{
    return [[self alloc] initWithName:stateName transition:transition];
}

- (id)initWithName:(NSString*)stateName transition:(DXStateTransition*)transition
{
    self = [super init];
    if (self) {
        self.transitions = [NSMutableArray new];
        self.name = stateName;
        [self.transitions addObject:transition];
    }
    return self;
}

- (void)addTransition:(DXStateTransition *)transition
{
    [self.transitions addObject:transition];
}

- (BOOL)canTransitionTo:(NSString *)stateName
{
    for (DXStateTransition *transition in self.transitions) {
        if ([transition.to isEqual:stateName]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![self isKindOfClass:[object class]]) {
        return NO;
    }
    
    DXState *other = (DXState *)object;

    __block BOOL transitionsEqual = self.transitions.count == other.transitions.count;
    BOOL nameEquals = [self.name isEqualToString:other.name];
    
    if (transitionsEqual) {
        [self.transitions enumerateObjectsUsingBlock:^(DXStateTransition *transition, NSUInteger idx, BOOL *stop) {
            if (![transition.to isEqual:other.transitions[idx]]) {
                transitionsEqual = NO;
                *stop = YES;
            }
        }];
    }
    
    return transitionsEqual && nameEquals;
}

- (NSString*)description
{
    return self.name;
}

@end
