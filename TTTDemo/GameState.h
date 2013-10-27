//
//  GameState.h
//  TTTDemo
//
//  Created by Dennis Lewandowski on 27/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@protocol GameStateDelegate <NSObject>
-(void)playerWonTheGame:(Player *)aPlayer;
@end


@interface GameState : NSObject

-(void)player:(Player *)aPlayer selectedRow:(NSUInteger)aRow column:(NSUInteger)aCol;
-(void)checkForWinner;

-(void)reset;

@property(nonatomic, strong) NSArray* fieldArray;
@property(nonatomic, weak) id<GameStateDelegate> delegate;

@end
