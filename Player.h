//
//  Player.h
//  TTTDemo
//
//  Created by Dennis Lewandowski on 27/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

-(id)initWithName:(NSString *)name icon:(NSString *)icon;

-(NSString *) name;
-(NSString *) icon;

@end
