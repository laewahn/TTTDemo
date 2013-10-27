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
    BOOL xHasTurn;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    xHasTurn = YES;

    NSArray* thePlayers = @[
                            [[Player alloc] initWithName:@"Player 1" icon:@"X"],
                            [[Player alloc] initWithName:@"Player 2" icon:@"O"]
                            ];
    [self setPlayers:thePlayers];
    [self setCurrentPlayer:[thePlayers firstObject]];
    
    [self.gameStateLabel setText:[NSString stringWithFormat:@"%@, it's your turn!", [self.currentPlayer name]]];
}

- (IBAction)gameButtonPressed:(id)sender {
    UIButton* theButton = (UIButton *)sender;
    
    if (xHasTurn) {
        [theButton setTitle:@"X" forState:UIControlStateNormal];
    } else {
        [theButton setTitle:@"O" forState:UIControlStateNormal];;
    }
    
    xHasTurn = !xHasTurn;
    [theButton setEnabled:NO];
}

@end
