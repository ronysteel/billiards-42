//
//  PhysicsComponent.h
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Component.h"
#import "PhysicsModel.h"

@interface PhysicsComponent : Component

@property (readonly) Model<PhysicsModel>* physicalModel;

@end
