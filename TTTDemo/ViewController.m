//
//  ViewController.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 24/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    BOOL xHasTurn;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    xHasTurn = YES;
    [self.gameStateLabel setText:@"Player 1, it's your turn!"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
