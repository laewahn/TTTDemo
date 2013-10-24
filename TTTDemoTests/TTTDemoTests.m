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
}


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
        XCTAssertNil([[aButton titleLabel] text], @"Button at label should be empty.");
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

@end
