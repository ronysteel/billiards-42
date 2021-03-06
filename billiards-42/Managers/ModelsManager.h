//
//  ModelsManager.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"
#import "Model.h"
#import "World.h"

@interface ModelsManager : NSObject

@property (readonly) World* world;

- (uint32_t) generateNewMid;
- (void) addModel:(Model *) model;
- (void) addComponent:(Component *)component toModel:(Model*)model;
- (Component *) getComponentOfClass:(Class) class forModel:(Model *)model;
- (void)removeModel:(Model *) model;
- (void) loadFromJSON:(NSString *) filePath;
- (NSMutableArray*) allComponents;
- (NSMutableArray*) allModels;

//- (NSArray *)getAllModelsPosessingComponentOfClass:(Class)class;

@end
