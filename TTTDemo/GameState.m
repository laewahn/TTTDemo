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
                       [NSMutableArray arrayWithObjects:[NSNull null], [NSNull null], [NSNull null], nil],
                       [NSMutableArray arrayWithObjects:[NSNull null], [NSNull null], [NSNull null], nil],
                       [NSMutableArray arrayWithObjects:[NSNull null], [NSNull null], [NSNull null], nil],
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
    id winner = nil;
    
    NSArray* winningConstellations = [self winningConstellations];
    for (NSArray* constellation in winningConstellations) {
        winner = [self winnerInConstellation:constellation];
        if (winner != nil) {
            [self.delegate playerWonTheGame:winner];
            return;
        }
    }
}

-(NSArray *)winningConstellations
{
    return @[
             // Horizontal
             @[[self fieldArray][0][0], [self fieldArray][0][1], [self fieldArray][0][2]],
             @[[self fieldArray][1][0], [self fieldArray][1][1], [self fieldArray][1][2]],
             @[[self fieldArray][2][0], [self fieldArray][2][1], [self fieldArray][2][2]],
             
             // Vertical
             @[[self fieldArray][0][0], [self fieldArray][1][0], [self fieldArray][2][0]],
             @[[self fieldArray][0][1], [self fieldArray][1][1], [self fieldArray][2][1]],
             @[[self fieldArray][0][2], [self fieldArray][1][2], [self fieldArray][2][2]],
             // Diagonal
             @[[self fieldArray][0][0], [self fieldArray][1][1], [self fieldArray][2][2]],
             @[[self fieldArray][0][2], [self fieldArray][1][1], [self fieldArray][2][0]]
             ];
}

-(Player *)winnerInConstellation:(NSArray *)constellation
{
    id winnerCandidate = [constellation firstObject];
    
    for (id position in constellation) {
        if(position != winnerCandidate || position == [NSNull null]) {
            return nil;
        }
    }
    
    return winnerCandidate;
}

@end