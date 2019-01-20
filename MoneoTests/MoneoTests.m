//
//  MoneoTests.m
//  MoneoTests
//
//  Created by Matthew Mower on 20/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MoneoParser.h"
#import "MoneoTemplate.h"

@interface MoneoTests : XCTestCase

@end

@implementation MoneoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParseKeyPath {
  MoneoParser *p = [[MoneoParser alloc] init];
  NSError *error = nil;
  MoneoTemplate *t = [p parseTemplate:@"{{=$foo/bar.textValue}}" error:&error];
  XCTAssertNotNil( t, @"Unable to parse template with complex keyPath" );
  XCTAssertEqualObjects( @[@"$foo/bar.textValue"], t.keyPaths );

}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
