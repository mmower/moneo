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

- (void)testRenderSimpleEmit {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"<p>The quality of mercy is not strained.</p>"];
  XCTAssertNotNil( t );
  XCTAssertNil( p.error );

  NSString *output = [t render:nil];
  XCTAssertEqualObjects( output, @"<p>The quality of mercy is not strained.</p>" );
  XCTAssertEqualObjects( @[], t.keyPaths );
}

- (void)testRenderEval {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"<p>{{=text}}</p>"];
  XCTAssertNotNil( t );
  XCTAssertNil( p.error );

  NSString *output = [t render:@{@"text":@"foo"}];
  XCTAssertEqualObjects( output, @"<p>foo</p>" );
  XCTAssertEqualObjects( @[@"text"], t.keyPaths );
}

- (void)testRenderIter {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"<ul>{{@items}}<li>{{=name}}</li>{{/}}</ul>"];
  XCTAssertNotNil( t );
  XCTAssertNil( p.error );

  NSString *output = [t render:@{
                                 @"items":@[
                                     @{@"name":@"Ted"},
                                     @{@"name":@"Dougal"}
                                     ]
                                 }];
  XCTAssertEqualObjects( output, @"<ul><li>Ted</li><li>Dougal</li></ul>" );
  XCTAssertEqualObjects( (@[@"items",@"name"]), t.keyPaths );
}

- (void)testRenderMissingIsMissing {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"{{!items}}<p>No items</p>{{/}}"];
  XCTAssertNotNil( t );
  XCTAssertNil( p.error );

  NSString *output = [t render:@{}];
  XCTAssertEqualObjects( output, @"<p>No items</p>" );
  XCTAssertEqualObjects( (@[@"items"]), t.keyPaths );
}

- (void)testRenderMissingIsPresent {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"{{!items}}<p>No items</p>{{/}}"];
  XCTAssertNotNil( t );
  XCTAssertNil( p.error );

  NSString *output = [t render:@{@"items":@[@"Hello World"]}];
  XCTAssertEqualObjects( output, @"" );
  XCTAssertEqualObjects( (@[@"items"]), t.keyPaths );
}


- (void)testParseKeyPath {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"{{=$foo/bar.textValue}}"];
  XCTAssertNotNil( t, @"Unable to parse template with complex keyPath" );
  XCTAssertNil( p.error );
  XCTAssertEqualObjects( @[@"$foo/bar.textValue"], t.keyPaths );
}

- (void)testPerformanceExample {
  MoneoParser *p = [[MoneoParser alloc] init];
  MoneoTemplate *t = [p parseTemplate:@"<ul>{{@items}}<li>{{=name}}</li>{{/}}</ul>"];
  t.bufferSize = 128;
  XCTAssertNotNil( t );
  XCTAssertNil( p.error );

  // This is an example of a performance test case.
  [self measureBlock:^{
    for( int i = 0; i < 10000; i++ ) {
    NSString *output = [t render:@{
                                   @"items":@[
                                       @{@"name":@"Ted"},
                                       @{@"name":@"Dougal"}
                                       ]
                                   }];
#pragma unused(output)
    }
  }];
}

@end
