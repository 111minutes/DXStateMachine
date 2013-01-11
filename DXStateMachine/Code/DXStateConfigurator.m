//
//  DXStateConfigurator.m
//  DXStateMachine
//
//  Created by Max Mashkov on 12/25/12.
//  Copyright (c) 2012 mashkovmax. All rights reserved.
//

#import "DXStateConfigurator.h"
#import "DXStateMachine.h"
#import "DXStateMachineProtocol.h"
#import "DXStateMachineAdditions.h"
#import <objc/runtime.h>

@interface DXStateConfigurator ()

@property (nonatomic, assign) dispatch_queue_t configurationQueue;

@end

@implementation DXStateConfigurator

- (void)dealloc
{
    dispatch_release(_configurationQueue);
}

- (id)init
{
    self = [super init];
    if (self) {
        self.configurationQueue = dispatch_queue_create("com.111minutes.state_configuration.queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)configureObject:(id)object withStateMachineConfigureBlock:(DXStateMachineConfigurationBlock)block
{
    NSAssert([object conformsToProtocol:@protocol(DXStateMachineProtocol)], @"add DXStateMachineProtocol support");
    
    __weak typeof (object) weakObject = object;
    dispatch_sync(_configurationQueue, ^{
        
        DXStateMachine *associatedStateMachine = objc_getAssociatedObject(weakObject, kStateMachineAssociationKey);
        
        if (!associatedStateMachine) {
            associatedStateMachine = [DXStateMachine new];
            
            objc_setAssociatedObject(weakObject,
                                     kStateMachineAssociationKey,
                                     associatedStateMachine,
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        if (!class_respondsToSelector([weakObject class], @selector(stateMachine))) {
            class_addMethod([weakObject class], @selector(stateMachine), (IMP) DXStateMachineImplementation, "@:");
        }
        
        if (!class_respondsToSelector([weakObject class], @selector(setState:))) {
            class_addMethod([weakObject class], @selector(setState:), (IMP) DXSetStateImplementation, "@:");
        }
        
        if (!class_respondsToSelector([weakObject class], @selector(state))) {
            class_addMethod([weakObject class], @selector(state), (IMP) DXGetStateImplementation, "@:");
        }
        
        block(associatedStateMachine);
    
    });
}

@end
