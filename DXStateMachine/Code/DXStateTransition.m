//
//  DXStateTransition.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateTransition.h"

@implementation DXStateTransition

+ (id)transitionFrom:(NSString *)from to:(NSString *)to {
    return [[self alloc] initFrom:from to:to];
}
- (id)initFrom:(NSString *)from to:(NSString *)to {
    self = [super init];
    if (self) {
        _from = [from copy];
        _to = [to copy];
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
    if (![self.from isEqualToString:other.from]) {
        return NO;
    }
    if (![self.to isEqualToString:other.to]) {
        return NO;
    }
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ from: '%@' to '%@'", self.class, self.from, self.to];
}

@end
