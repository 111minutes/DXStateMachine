//
//  DXStateTransition.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateTransition.h"

@interface DXStateTransition ()

@property (nonatomic, copy) NSString *to;

@end

@implementation DXStateTransition

+ (id)transitionTo:(NSString *)to {
    return [[self alloc] initTo:to];
}

- (id)initTo:(NSString *)to {
    self = [super init];
    if (self) {
        self.to = [to copy];
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (![self isKindOfClass:[object class]]) {
        return NO;
    }
    
    DXStateTransition *other = (DXStateTransition *)object;
    if (![self.to isEqualToString:other.to]) {
        return NO;
    }
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ to '%@'", self.class, self.to];
}

@end
