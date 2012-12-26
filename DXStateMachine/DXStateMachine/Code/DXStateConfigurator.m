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
#import <objc/runtime.h>

const char *kStateMachineAssociationKey = "kStateMachineAssociationKey";

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
        self.configurationQueue = dispatch_queue_create("DXStateConfigurator configuration queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

DXStateMachine* DXStateMachineImplementation(id self, SEL _cmd) {
    DXStateMachine *associatedStateMachine = objc_getAssociatedObject(self, &kStateMachineAssociationKey);
    
    return associatedStateMachine;
}

- (void)configureObject:(id)object withStateMachineConfigureBlock:(DXStateMachineConfigurationBlock)block
{
    __weak typeof (object) weakObject = object;
    dispatch_async(_configurationQueue, ^{
        if (![object conformsToProtocol:@protocol(DXStateMachineProtocol)]) {
            class_addProtocol(weakObject, @protocol(DXStateMachineProtocol));
        }
        
        DXStateMachine *associatedStateMachine = objc_getAssociatedObject(weakObject, &kStateMachineAssociationKey);
        
        if (!associatedStateMachine) {
            associatedStateMachine = [DXStateMachine new];
            
            objc_setAssociatedObject(weakObject,
                                     &kStateMachineAssociationKey,
                                     associatedStateMachine,
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        if (!class_respondsToSelector([weakObject class], @selector(stateMachine))) {
            class_addMethod([weakObject class], @selector(stateMachine), (IMP) DXStateMachineImplementation, "@:");
        }
        
        block(associatedStateMachine);
    });
}

@end
