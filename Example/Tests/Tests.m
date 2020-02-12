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

#pragma mark - 模拟校验君弘项目中接口返回的数据

- (void)testGJNewsResponseDataExample {
    NSDictionary *json = @{@"msg": @"success",
                           @"error": @"noError",
                           @"data": @{@"typeCode": @"9201",
                                      @"pictureUrl": @"https://12333333333333",
                                      @"responseListFirst": @[@{@"name": @"张三",
                                                                @"sex": @"男",
                                                                @"number":@1
                                                                },
                                                              @{@"name": @"张三",
                                                                @"sex": @"男",
                                                                @"number": @1
                                                                }
                                                             ]
                                    }
                          };
    
    
    // 指定需要校验的数据格式
    NSDictionary *validator = @{@"msg": [NSString class],
                                @"data": @{@"responseListFirst" : @[@{}]}
                               };
    // 校验后台返回的数据结构
    BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
    
    // 解析后台数据
    if (result) {
        NSString *msg = [json valueForKey:@"msg"];
        if ([msg isEqualToString:@"success"]) {
            NSDictionary *data = json[@"data"];
            NSArray *responseListFirst = data[@"responseListFirst"];
            
            [responseListFirst enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                // 创建模型，不用再校验obj是否是字典类型了，上面已经校验好了
            }];
        }
    } else {
        NSLog(@"后台接口返回的数结构有误！！！！");
    }
    
    XCTAssertTrue(result);
}

- (void)testGJNewsResponseDataExampleFail {
    NSDictionary *json = @{@"msg": @"success",
                           @"error": @"noError",
                           @"data": @{@"typeCode": @"9201",
                                      @"pictureUrl": @"https://12333333333333",
                                      @"responseListFirst": @[@"1", @"1"]
                                    }
                          };
    
    
    // 指定需要校验的数据格式
    NSDictionary *validator = @{@"msg": [NSString class],
                                @"data": @{@"responseListFirst" : @[@{}]}
                               };
    // 校验后台返回的数据结构
    BOOL result = [GJNewsDataSafe validateJSON:json withValidator:validator];
    
    // 解析后台数据
    if (result) {
        NSString *msg = [json valueForKey:@"msg"];
        if ([msg isEqualToString:@"success"]) {
            NSDictionary *data = json[@"data"];
            NSArray *responseListFirst = data[@"responseListFirst"];
            
            [responseListFirst enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                // 创建数组模型，不用再校验obj是否是字典类型了，上面已经校验好了
            }];
        }
    } else {
        NSLog(@"后台接口返回的数结构有误！！！！");
    }
    
    XCTAssertTrue(result);
}

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

#pragma mark - 选择性校验某些数据结构

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

#pragma mark - 测试不可变数组的一些安全性方法

- (void)testGetObjectFromArraySafe1 {
    NSArray *array = @[@"1", @"1"];
    
    id result = [GJNewsDataSafe objectAtIndexSafe:0 array:array];
    
    XCTAssertNotNil(result);
}

- (void)testGetObjectFromArraySafe2 {
    NSArray *array = @[@"1", @"1"];
    
    id result = [GJNewsDataSafe objectAtIndexSafe:20 array:array];
    
    XCTAssertNil(result);
}

- (void)testGetObjectFromMutArraySafe1 {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id result = [GJNewsDataSafe objectAtIndexSafe:0 array:mutArray];
    
    XCTAssertNotNil(result);
}

- (void)testGetObjectFromMutArraySafe2 {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id result = [GJNewsDataSafe objectAtIndexSafe:20 array:mutArray];
    
    XCTAssertNil(result);
}

#pragma mark - 测试可变数组的一些安全性方法

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
    
    [GJNewsDataSafe insertObjectSafe:@"1" atIndex:20 array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testInsertNilObjectAtIndexToMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id object = nil;
    
    [GJNewsDataSafe insertObjectSafe:object atIndex:1 array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testInsertNullObjectAtIndexToMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    id object = NULL;
    
    [GJNewsDataSafe insertObjectSafe:object atIndex:1 array:mutArray];
    
    XCTAssertTrue(true);
}

- (void)testReplaceBeyondIndexObjectFromMutArraySafe {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"1", @"1"]];
    
    [GJNewsDataSafe replaceObjectAtIndexSafe:20 withObject:@"2" array:mutArray];
    
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

- (void)testSetNilValueForKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id object = nil;
    id key = @"key3";

    [GJNewsDataSafe setValueSafe:object forKey:key dict:mutDict];

    XCTAssertTrue(true);
}

- (void)testSetNullValueForKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id object = NULL;
    id key = @"key3";

    [GJNewsDataSafe setValueSafe:object forKey:key dict:mutDict];

    XCTAssertTrue(true);
}

- (void)testSetValueForNilKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id object = @"value3";
    id key = nil;

    [GJNewsDataSafe setValueSafe:object forKey:key dict:mutDict];

    XCTAssertTrue(true);
}

- (void)testSetValueForNullKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id object = @"value3";
    id key = NULL;

    [GJNewsDataSafe setValueSafe:object forKey:key dict:mutDict];

    XCTAssertTrue(true);
}

#pragma mark - 测试字典的valueForKey的安全性方法

- (void)testMutDictValueForNilKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id key = nil;

    id result = [GJNewsDataSafe valueForKeySafe:key dict:mutDict];

    XCTAssertNil(result);
}

- (void)testMutDictValueForNullKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id key = NULL;

    id result = [GJNewsDataSafe valueForKeySafe:key dict:mutDict];

    XCTAssertNil(result);
}

- (void)testMutDictValueForNoStringKeySafe {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];

    id key = @1;

    id result = [GJNewsDataSafe valueForKeySafe:key dict:mutDict];

    XCTAssertNil(result);
}

#pragma mark - 测试从字典中获取指定类型的值

- (void)testGetDesignativeClassValueFromDict1 {
    NSDictionary *dict = @{@"key1":@"value1", @"key2":@"value2"};
    
    id key = @"key1";
    
    id result = [GJNewsDataSafe valueForKeySafe:key dict:dict valueClass:[NSString class]];
    
    XCTAssertNotNil(result);
}

- (void)testGetDesignativeClassValueFromDict2 {
    NSDictionary *dict = @{@"key1":@"value1", @"key2":@"value2"};
    
    id key = @"key1";
    
    id result = [GJNewsDataSafe valueForKeySafe:key dict:dict valueClass:[NSArray class]];
    
    XCTAssertNil(result);
}

- (void)testGetDesignativeClassValueFromDictFail3 {
    NSDictionary *dict = @{@"key1":@"value1", @"key2":@"value2"};
    
    id key = nil;
    
    id result = [GJNewsDataSafe valueForKeySafe:key dict:dict valueClass:[NSString class]];
    
    XCTAssertNil(result);
}

- (void)testGetDesignativeClassValueFromMutDict1 {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];
    
    id key = @"key1";
    
    id result = [GJNewsDataSafe valueForKeySafe:key dict:dict valueClass:[NSString class]];
    
    XCTAssertNotNil(result);
}

- (void)testGetDesignativeClassValueFromMutDict2 {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];
    
    id key = @"key1";
    
    id result = [GJNewsDataSafe valueForKeySafe:key dict:dict valueClass:[NSArray class]];
    
    XCTAssertNil(result);
}

- (void)testGetDesignativeClassValueFromMutDict3 {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"key1":@"value1", @"key2":@"value2"}];
    
    id key = @1;
    
    id result = [GJNewsDataSafe valueForKeySafe:key dict:dict valueClass:[NSString class]];
    
    XCTAssertNil(result);
}

@end

