//
//  DXStateTransition.h
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

@interface DXStateTransition : NSObject

@property (nonatomic, copy, readonly) NSString *from;
@property (nonatomic, copy, readonly) NSString *to;

+ (id)transitionFrom:(NSString *)from to:(NSString *)to;
- (id)initFrom:(NSString *)from to:(NSString *)to;

@end
