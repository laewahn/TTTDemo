//
//  PlayerTests.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 27/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Player.h"


@interface PlayerTests : XCTestCase {
    Player* testPlayer;
}
@end


@implementation PlayerTests;


# pragma mark Set up

-(void)setUp
{
    testPlayer = [[Player alloc] init];
}

# pragma mark Initialization tests

-(void)testPlayerCanBeInitializedWithNameAndIcon
{
    XCTAssertNoThrow(testPlayer = [[Player alloc] initWithName:@"foo" icon:@"bar"], @"Initializing a player with name and icon should be possible.");
    XCTAssertEqualObjects([testPlayer name], @"foo", @"Name should be foo");
    XCTAssertEqualObjects([testPlayer icon], @"bar", @"Icon should be bar.");
}

-(void)testPlayerHasDefaultNameAndIconAfterInitialization
{
    XCTAssertEqualObjects([testPlayer name], @"noname", @"Name should default to noname");
    XCTAssertEqualObjects([testPlayer icon], @"", @"Icon should default to empty string.");
}

# pragma mark Property access tests

-(void)testPlayerHasAName
{
    XCTAssertNoThrow([testPlayer name], @"Name should be accessable.");
}

-(void)testPlayerHasAnIcon
{
    XCTAssertNoThrow([testPlayer icon], @"Icon should be accessable.");
}

-(void)testNameIsNotNil
{
    XCTAssertNotNil([testPlayer name], @"Name should not be nil after default initialization.");
}

-(void)testIconIsNotNil
{
    XCTAssertNotNil([testPlayer icon], @"Icon should not be nil after default initialization.");
}

@end
