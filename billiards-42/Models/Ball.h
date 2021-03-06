//
//  Ball.h
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"
#import "RenderableModel.h"
#import "PhysicsModel.h"
#import "BallControlComponent.h"

@interface Ball : Model  <RenderableModel, PhysicsModel> {
    cpBody * _cpBody;
    cpShape * _cpShape;
}

@property CGPoint position; // ball position
@property CGFloat radius; // ball radius

@end
