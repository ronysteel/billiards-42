//
//  WorldView.m
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "WorldView.h"

@implementation WorldView

- (void) startup {
    // creates sprite on layer
    NSLog(@"WordView startup method call!");
    CCSprite* sprite = [CCSprite spriteWithTexture: [self.model getTexture]];
    
    sprite.position = [self.model getPosition];
    sprite.anchorPoint = CGPointZero;
    
    self.node = sprite; //save sprite back to model
    
    [self.renderLayer addChild:sprite];
}

- (void) update:(ccTime)delta {
    
}

@end
