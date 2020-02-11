//
//  GJNewsDataSafeTests.m
//  GJNewsDataSafeTests
//
//  Created by wuweiwei on 02/11/2020.
//  Copyright (c) 2020 wuweiwei. All rights reserved.
//

@import XCTest;

#import <GJNewsDataSafe/GJNewsDataSafe.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)test1 {
    NSDictionary *validator = @{
        @"nick": [NSString class],
        @"level": [NSString class]
    };
    
    NSDictionary *json = @{@"nick": @"123", @"level": @"344"};
    
    BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
    
    XCTAssertTrue(result);
}

- (void)test2 {
    NSDictionary *json = @{
           @"son": @{
               @"age": @14,
           },
           @"name": @"family"
       };
    
       NSDictionary *validator = @{
           @"son": @{@"age" : [NSNumber class]},
           @"name": [NSString class]
       };
       BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
       XCTAssertTrue(result);
}

- (void)test3 {
    NSArray *json =@[@{@"id": @1,
                       @"imageId": @"13",
                       @"time":  @"2016.12.11",
                       @"status": @"1",
                       @"data": @[@{@"name": @"张三",
                                    @"sex": @"男",
                                    @"number": @1
                                   },
                                  @{@"name": @"张三",
                                   @"sex": @"男",
                                   @"number": @1
                                  },
                                  @{@"name": @"张三",
                                   @"sex": @"男",
                                   @"number": @1
                                  }
                                ]
                      }
                    ];
  
    NSArray *validator = @[@{@"id": [NSNumber class],
                             @"imageId": [NSString class],
                             @"time": [NSString class],
                             @"status": [NSString class],
                             @"data": @[@{@"name": [NSString class],
                                        @"sex": [NSString class],
                                        @"number": [NSNumber class]}
                                       ]
                             }
                          ];
    BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
    XCTAssertTrue(result);
    
}

- (void)test4 {
    NSArray *json =@[@{@"id": @1,
                       @"imageId": @"13",
                       @"time":  @"2016.12.11",
                       @"status": @"1",
                       @"data": @[@{@"name": @"张三",
                                    @"sex": @"男",
                                    @"number": @1
                                   },
                                  @{@"name": @"张三",
                                   @"sex": @"男",
                                   @"number": @1
                                  },
                                  @{@"name": @"张三",
                                   @"sex": @"男",
                                   @"number": @1
                                  }
                                ]
                      }
                    ];
  
    NSArray *validator = @[@{@"id": [NSNumber class],
                             @"status": [NSString class],
                             @"data": @[@{@"name": [NSString class],
                                        @"sex": [NSString class],
                                        @"number": [NSNumber class]}
                                       ]
                             }
                          ];
    BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
    XCTAssertTrue(result);
    
}


@end

