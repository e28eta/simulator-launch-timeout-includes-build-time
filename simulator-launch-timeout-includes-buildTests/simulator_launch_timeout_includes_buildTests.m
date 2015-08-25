//
//  simulator_launch_timeout_includes_buildTests.m
//  simulator-launch-timeout-includes-buildTests
//
//  Created by Jackson, Daniel on 8/24/15.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface simulator_launch_timeout_includes_buildTests : XCTestCase

@end

@implementation simulator_launch_timeout_includes_buildTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
