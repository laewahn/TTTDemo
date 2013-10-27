//
//  GameState.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 27/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id)init
{
    self = [super init];
    
    if (self) {
        _fieldArray = [NSArray arrayWithObjects:
                       [NSArray arrayWithObjects:[NSNull null], [NSNull null], [NSNull null], nil],
                       [NSArray arrayWithObjects:[NSNull null], [NSNull null], [NSNull null], nil],
                       [NSArray arrayWithObjects:[NSNull null], [NSNull null], [NSNull null], nil],
                       nil];
    }
    
    return self;
}

-(void)player:(Player *)aPlayer selectedRow:(NSUInteger)aRow column:(NSUInteger)aCol
{
    [self fieldArray][aRow][aCol] = aPlayer;
}

-(void)checkForWinner
{
    
}

@end
