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
@property (nonatomic, strong) DXStateTransition *transition;

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
        self.name = stateName;
        self.transition = transition;
    }
    return self;
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
    
    BOOL transitionEquals = [self.transition isEqual:other.transition];
    BOOL nameEquals = [self.name isEqualToString:other.name];
    
    return transitionEquals && nameEquals;
}

@end
