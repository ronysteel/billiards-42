//
//  GameController.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "GameController.h"
#import "ZoomAndPanComponent.h"
#import "Ball.h"
#import "Pocket.h"
#import "Wall.h"

@implementation GameController

- (id) init {
    if((self = [super init])) {
        self.modelsManager = [[ModelsManager alloc] init];
    }
    return self;
}


- (id) initWithJSON:(NSString *)filePath {
    if([self init]) {
        [self loadFromJSON:filePath];
    }
    return self;
}

- (void) loadFromJSON:(NSString *)filePath {
    [self.modelsManager loadFromJSON:filePath];
}

// starts everything
- (void) start {
    NSMutableArray* components = [self.modelsManager allComponents];
    for (Component* component in components) {
        component.renderLayer = self.renderLayer;
        component.physicsSpace = self.physicsSpace;
        component.controlLayer = self.controlLayer;
        component.delegate = self;
    }
    [self componentsStartup];
}

- (void) update:(ccTime)delta {
    [self componentsUpdate:delta];
}

- (void) componentsHookHelper:(NSString *)methodName {
    SEL selector = NSSelectorFromString(methodName);
    NSMutableArray* components = [self.modelsManager allComponents];
    for (Component* component in components) {
        [component performSelector:selector];
    }
}

// calls Startup for every component
- (void) componentsStartup{
    [self componentsHookHelper:@"startup"];
}

// calls beforeRemove for every component
- (void) componentsBeforeRemove{
    [self componentsHookHelper:@"beforeRemove"];
}

// calls Update for every component
- (void) componentsUpdate:(ccTime)delta {
    NSMutableArray* components = [self.modelsManager allComponents];
    for (Component* component in components) {
        [component update:delta];
    }
}

- (void) enableZoomAndPan {
    [[ZoomAndPanComponent fromModel:_modelsManager.world] enable];
}

- (void) disableZoomAndPan {
    [[ZoomAndPanComponent fromModel:_modelsManager.world] disable];
}

// GameDelegate

- (void) handleCollisionOf:(Model<PhysicsModel> *)modelA and:(Model<PhysicsModel> *)modelB {
    // ball -> pocket
    if( [modelA isKindOfClass:[Ball class]] && [modelB isKindOfClass:[Pocket class]]) {
        [self ball:modelA inPocket:modelB];
    }
    // ball -> wall
    if([modelA isKindOfClass:[Ball class]] && [modelB isKindOfClass:[Wall class]]) {
        NSLog(@"!!! Ball hit wall");
    }
    // ball -> ball
    if([modelA isKindOfClass:[Ball class]] && [modelB isKindOfClass:[Ball class]]) {
        NSLog(@"!!! Ball hit Ball");
    }
}

- (void) ball:(NSObject *)ball inPocket:(NSObject *)pocket {
    Ball* ballModel = (Ball*) ball;
    NSLog(@"!!! Ball in pocket event raised %d",[ballModel getMid]);
}

@end
