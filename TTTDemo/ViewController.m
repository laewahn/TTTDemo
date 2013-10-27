//
//  ViewController.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 24/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import "ViewController.h"

#import "Player.h"
#import "GameState.h"

@interface ViewController () {
    NSInteger currentPlayerIndex;
    BOOL gameWon;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.resetButton setEnabled:NO];
    
    [self setGameState:[[GameState alloc] init]];
    [self.gameState setDelegate:self];
    
    currentPlayerIndex = 0;
    gameWon = 0;
    
    NSArray* thePlayers = @[
                            [[Player alloc] initWithName:@"Player 1" icon:@"X"],
                            [[Player alloc] initWithName:@"Player 2" icon:@"O"]
                            ];
    
    [self setPlayers:thePlayers];
    [self setCurrentPlayer:[thePlayers firstObject]];
    [self updateStateLabel];
}

- (IBAction)gameButtonPressed:(id)sender {
    
    UIButton* theButton = (UIButton *)sender;
    [theButton setTitle:[self.currentPlayer icon] forState:UIControlStateNormal];
    [theButton setEnabled:NO];
    
    NSUInteger row = [theButton tag] / 10;
    NSUInteger column = [theButton tag] % 10;
    [self.gameState player:[self currentPlayer] selectedRow:row column:column];
    [self.gameState checkForWinner];
    
    [self setCurrentPlayer:[self.players objectAtIndex:(++currentPlayerIndex) % 2]];
    [self updateStateLabel];
    
    [self.resetButton setEnabled:YES];
}

- (IBAction)resetButtonPressed:(id)sender
{
    [self.gameState reset];
}

-(void)updateStateLabel
{
    if (!gameWon) {
        [self.gameStateLabel setText:[NSString stringWithFormat:@"%@, it's your turn!", [self.currentPlayer name]]];
    }
}


# pragma mark GameStateDelegate implementation

-(void)playerWonTheGame:(Player *)aPlayer
{
    [self.gameStateLabel setText:[NSString stringWithFormat:@"%@ won the game!", [aPlayer name]]];
    gameWon = YES;
}

@end
