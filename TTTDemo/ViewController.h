//
//  ViewController.h
//  TTTDemo
//
//  Created by Dennis Lewandowski on 24/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player;

@interface ViewController : UIViewController

- (IBAction)gameButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *gameStateLabel;

@property (strong, nonatomic) Player* currentPlayer;
@property (strong, nonatomic) NSArray* players;

@end
