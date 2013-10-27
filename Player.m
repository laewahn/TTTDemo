//
//  Player.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 27/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import "Player.h"

@interface Player() {
    NSString* _name;
    NSString* _icon;
}
@end

@implementation Player

-(id)init
{
    return [self initWithName:@"noname" icon:@""];
}

- (id)initWithName:(NSString *)name icon:(NSString *)icon
{
    self = [super init];
    
    if (self) {
        _name = name;
        _icon = icon;
    }
    
    return self;
}

-(NSString *)name
{
    return _name;
}

-(NSString *) icon
{
    return _icon;
}

@end
