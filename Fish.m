//
//  Fish.m
//  Flight
//
//  Created by Ben Sheppard on 2/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Fish.h"

@implementation Fish

-(void)didLoadFromCCB
{
    self.physicsBody.collisionType = @"fish";
}

@end
