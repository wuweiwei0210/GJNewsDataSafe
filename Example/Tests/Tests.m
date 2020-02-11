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

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

- (void)testCheckResponseData1 {
    NSDictionary *validator = @{
        @"nick": [NSString class],
        @"level": [NSString class]
    };
    
    NSDictionary *json = @{@"nick": @"123", @"level": @"344"};
    
    BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
    
    XCTAssertTrue(result);
    
}

- (void)testCheckResponseData2 {
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

- (void)testCheckResponseData3 {
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

- (void)testCheckResponseData4 {
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

- (void)testGetObjectFromArraySafe {
    NSArray *array = @[@"1", @"1"];
    
    id result = [GJNewsDataSafe objectAtIndexSafe:20 array:array];
    
    XCTAssertNil(result);
}

- (void)testGetObjectFromMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id result = [GJNewsDataSafe objectAtIndexSafe:20 array:mutArray];
    
    XCTAssertNil(result);
}

- (void)testAddNilObjectToMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id object = nil;
    
    [GJNewsDataSafe addObjectSafe:object array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testAddNullObjectToMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id object = NULL;
    
    [GJNewsDataSafe addObjectSafe:object array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testRemoveObjectAtBeyondIndexFromMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    [GJNewsDataSafe removeObjectAtIndexSafe:20 array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testInsertObjectAtBeyondIndexToMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    [GJNewsDataSafe insertObjectSafe:@"" atIndex:20 array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testReplaceBeyondObjectFromMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    [GJNewsDataSafe replaceObjectAtIndexSafe:20 withObject:@"" array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testReplaceNilObjectFromMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id object = nil;
    
    [GJNewsDataSafe replaceObjectAtIndexSafe:0 withObject:object array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testReplaceNullObjectFromMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id object = NULL;
    
    [GJNewsDataSafe replaceObjectAtIndexSafe:0 withObject:object array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testSetvalueForNilKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id object = @"value3";
    id key = nil;

    [GJNewsDataSafe setValueSafe:object forKey:key dict:mutDict];

    XCTAssertTrue(true);
}

- (void)testSetvalueForNullKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id object = @"value3";
    id key = NULL;

    [GJNewsDataSafe setValueSafe:object forKey:key dict:mutDict];

    XCTAssertTrue(true);
}

- (void)testValueForNilKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id key = nil;

    id result = [GJNewsDataSafe valueForKeySafe:key dict:mutDict];

    XCTAssertNil(result);
}

- (void)testValueForNullKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id key = NULL;

    id result = [GJNewsDataSafe valueForKeySafe:key dict:mutDict];

    XCTAssertNil(result);
}

- (void)testValueForNoStringClassSafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id key = @1;

    id result = [GJNewsDataSafe valueForKeySafe:key dict:mutDict];

    XCTAssertNil(result);
}

@end

