//
//  TTTDemoTests.m
//  TTTDemoTests
//
//  Created by Dennis Lewandowski on 24/10/13.
//  Copyright (c) 2013 i10 RWTH. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ViewController.h"

@interface TTTDemoTests : XCTestCase {
    ViewController* testViewController;
}

@end

@implementation TTTDemoTests

-(void)setUp
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    testViewController = [storyboard instantiateInitialViewController];
    [testViewController view];
}


# pragma mark -
# pragma mark Release 1

# pragma mark Test state after initialization

-(void)testViewControllerHasAView
{
    XCTAssertNotNil([testViewController view], @"Should have a view.");
}

-(void)testViewControllerHasNineButtons
{
    NSIndexSet* buttonSubviewIndexes = [self indexesOfButtonsInView:[testViewController view]];
    XCTAssertEqual([buttonSubviewIndexes count], (NSUInteger) 9, @"There should be 9 buttons.");
}

-(void)testAllNineButtonsAreEmpty
{
    for (UIButton* aButton in [self buttonsInView:[testViewController view]]) {
        XCTAssertEqualObjects([aButton titleForState:UIControlStateNormal], @"-", @"Button at label should show -.");
    }
}

-(void)testAllButtonsCallTheViewControllerOnTouchUp
{
    for (UIButton* aButton in [self buttonsInView:[testViewController view]]) {
        XCTAssertTrue([[aButton actionsForTarget:testViewController forControlEvent:UIControlEventTouchUpInside] containsObject:@"gameButtonPressed:"], @"The button should be connected to the view controllers gameButtonPressed: method.");
    }
}


# pragma mark Interaction tests

-(void)testTheFirstButtonPressedShowsAnX
{
    NSArray* buttons = [self buttonsInView:[testViewController view]];
    UIButton* anyButton = [buttons firstObject];
    
    [testViewController gameButtonPressed:anyButton];
    XCTAssertEqualObjects([[anyButton titleLabel] text], @"X", @"The button should now show an X.");
}

-(void)testTheSecondButtonPressedShowsAnO
{
    NSArray* buttons = [self buttonsInView:[testViewController view]];

    UIButton* firstButton = [buttons firstObject];
    [testViewController gameButtonPressed:firstButton];
    
    UIButton* otherButton = [buttons lastObject];
    [testViewController gameButtonPressed:otherButton];
    XCTAssertEqualObjects([[otherButton titleLabel] text], @"O", @"The other button should now show an O.");
}

-(void)testThirdButtonPressedShowsAnXAgain
{
    NSArray* buttons = [self buttonsInView:[testViewController view]];
    
    [testViewController gameButtonPressed:[buttons firstObject]];
    [testViewController gameButtonPressed:[buttons objectAtIndex:1]];
    
    UIButton* lastButton = [buttons lastObject];
    [testViewController gameButtonPressed:lastButton];

    XCTAssertEqualObjects([[lastButton titleLabel] text], @"X", @"The last button should now show an X again.");
}

-(void)testButtonIsDisabledAfterBeingPressed
{
    NSArray* buttons = [self buttonsInView:[testViewController view]];
    UIButton* anyButton = [buttons firstObject];
    
    [testViewController gameButtonPressed:anyButton];
    XCTAssertFalse([anyButton isEnabled], @"Button should be disabled after being clicked.");
}


# pragma mark Helpers

-(NSArray* )buttonsInView:(UIView *)aView
{
    NSArray* subviews = [aView subviews];
    return [subviews objectsAtIndexes:[self indexesOfButtonsInView:aView]];
}

-(NSIndexSet *)indexesOfButtonsInView:(UIView *)aView
{
    NSArray* subviews = [aView subviews];
    NSIndexSet* buttonSubviewIndexes = [subviews indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isMemberOfClass:[UIButton class]];
    }];
    
    return buttonSubviewIndexes;
}


# pragma mark -
# pragma mark Release 2

# pragma mark Test state after initialization

-(void)testViewControllerHasAStateLabelAfterTheViewWasLoaded
{
    XCTAssertNotNil([testViewController gameStateLabel], @"The view should have a label for the game state.");
}

-(void)testStatusLabelShowsFirstPlayersTurnAfterInitialization
{
    XCTAssertEqualObjects([[testViewController gameStateLabel] text], @"Player 1, it's your turn!", @"Label should indicate that it's players1's turn.");
}

-(void)testViewControllerHasCurrentPlayer
{
    XCTAssertNoThrow([testViewController currentPlayer], @"There should be a current player property.");
}

-(void)testViewControllerHasArrayOfAllPlayers
{
    XCTAssertNoThrow([testViewController players], @"There should be an array with all the players.");
}

-(void)testViewControllerHasTwoPlayersAfterBeingLoaded
{

    XCTAssertNotNil([testViewController players], @"The players array should have been initialized.");
    XCTAssertEqual([testViewController.players count], (NSUInteger) 2, @"There should be two players.");
}

-(void)testCurrentPlayerIsFirstPlayerAfterInitialization
{
    XCTAssertEqualObjects([testViewController currentPlayer], [testViewController.players firstObject], @"The first turn should go to player 1.");
}


# pragma mark Interaction tests

-(void)testPlayerSwitchesAfterEveryButtonPress
{
    UIButton* anyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testViewController gameButtonPressed:anyButton];
    
    XCTAssertEqualObjects([testViewController currentPlayer], [testViewController.players lastObject], @"It should be the secont players turn.");
    XCTAssertNoThrow([testViewController gameButtonPressed:anyButton], @"Next turn should not crash.");
    
    XCTAssertEqualObjects([testViewController currentPlayer], [testViewController.players firstObject], @"Not it should be the first players turn again.");
}

-(void)testLabelIsUpdatedAfterEveryTurn
{
    UIButton* anyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testViewController gameButtonPressed:anyButton];
    
    XCTAssertEqualObjects([testViewController.gameStateLabel text], @"Player 2, it's your turn!", @"Label should have been updated.");
    
    [testViewController gameButtonPressed:anyButton];
    XCTAssertEqualObjects([testViewController.gameStateLabel text], @"Player 1, it's your turn!", @"Label should have been updated.");
}


# pragma mark -
# pragma mark Release 3

# pragma mark Test state after initialization

-(void)testAppHasSomeKindOfGameState
{
    XCTAssertNotNil([testViewController gameState], @"There should be a game state.");
}

@end
