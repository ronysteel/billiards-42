//
//  HelloWorldLayer.h
//  billiards-42
//
//  Created by Admin on 9/19/13.
//  Copyright SalkoDev 2013. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// Importing Chipmunk headers
#import "chipmunk.h"

#import "GameController.h"
#import "Ball.h"

@interface ArcadeGameLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
	CCTexture2D *_spriteTexture; // weak ref
	CCPhysicsDebugNode *_debugLayer; // weak ref
	
	cpSpace *_space; // strong ref
	
	cpShape *_walls[4];
    
    GameController *_controller;
    Ball * _touched_ball;
}

@end
