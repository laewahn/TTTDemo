//
//  GameStateTests.m
//  TTTDemo
//
//  Created by Dennis Lewandowski on 27/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "GameState.h"
#import "Player.h"

@interface GameStateTests : XCTestCase {
    GameState* testState;
}
@end

@implementation GameStateTests

-(void)setUp
{
    testState = [[GameState alloc] init];
}

# pragma mark Initialization tests

-(void)testGameStateHasAnArrayToKeepTrackOfTheState
{
    XCTAssertNotNil([testState fieldArray], @"There should be an array.");
}

-(void)testFieldArrayHasThreeSubarraysForEachRow
{
    XCTAssertEqual([testState.fieldArray count], (NSUInteger) 3, @"There should be 3 other arrays in the array.");
}


# pragma mark Public method tests

-(void)testSelectingAFieldSetsThePlayerThere
{
    Player* testPlayer = [[Player alloc] init];
    NSArray* field = [testState fieldArray];
    
    [testState player:testPlayer selectedRow:1 column:2];
    XCTAssertEqualObjects(field[1][2], testPlayer, @"The player should have been set.");
    
    [testState player:testPlayer selectedRow:0 column:0];
    XCTAssertEqualObjects(field[1][2], testPlayer, @"The player should have been set.");
}
@end
