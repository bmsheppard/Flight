#import "MainScene.h"

#import "CCPhysics+ObjectiveChipmunk.h"
#import "cocos2d.h"
#import "Fish.h"

@implementation MainScene
{
    CCPhysicsNode *_physicsNode;
    CCNode *_mainScene;
    
    CCNode *_cloud;
}

-(void)didLoadFromCCB
{
    _physicsNode.collisionDelegate = self; //sets up the physics in the scene
    _physicsNode.debugDraw = TRUE;
    self.userInteractionEnabled = TRUE;
   
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [CCBReader load:@"Fish"];
}



-(void)onEnter
{
    [super onEnter];
    CCNode* fish = [CCBReader load:@"Fish"];
    fish.position = ccp(300,400);
    
    [_physicsNode addChild:fish];
    
    self.position = ccp(0,-100);
    CCActionFollow *follow = [CCActionFollow actionWithTarget:fish worldBoundary:self.boundingBox];
    [self runAction:follow];
}
-(BOOL) ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair fish:(CCNode *)nodeA wildcard:(CCNode *)nodeB
{
    CCLOG(@"Fish touched something");
    return YES;
}

-(BOOL) ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair fish:(CCNode *)nodeA wildcard:(CCNode *)nodeB
{
    CCLOG(@"The fish is touched");
    return YES;
}

-(void) ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair fish:(CCSprite *)fish wildcard:(CCNode *)nodeB
{
    CCLOG(@"The fish is touched");
    CGPoint velocity = fish.physicsBody.velocity;
    fish.physicsBody.velocity = ccpMult(ccpNormalize(velocity), 500 + 100);

}
@end

