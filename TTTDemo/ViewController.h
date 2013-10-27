//
//  ViewController.h
//  TTTDemo
//
//  Created by Dennis Lewandowski on 24/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)gameButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *gameStateLabel;

@end
