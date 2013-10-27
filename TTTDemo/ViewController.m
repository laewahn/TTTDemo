//
//  ViewController.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 24/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import "ViewController.h"

#import "Player.h"

@interface ViewController () {
    NSInteger currentPlayerIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    currentPlayerIndex = 0;
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
    
    [self setCurrentPlayer:[self.players objectAtIndex:(++currentPlayerIndex) % 2]];
    [self updateStateLabel];
}

-(void)updateStateLabel
{
    [self.gameStateLabel setText:[NSString stringWithFormat:@"%@, it's your turn!", [self.currentPlayer name]]];
}

@end
