//
//  BYViewController.m
//  GJNewsDataSafe
//
//  Created by wuweiwei on 02/11/2020.
//  Copyright (c) 2020 wuweiwei. All rights reserved.
//

#import "BYViewController.h"
#import <GJNewsDataSafe/GJNewsDataSafe.h>

@interface BYViewController ()

@end

@implementation BYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}


- (void)test1 {
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
    
    if (result) {
        NSLog(@"test1数据校验成功！！！！！");
    } else {
        NSLog(@"test1数据校验失败！！！！！");
    }
}

- (void)test2 {
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
    
    if (result) {
        NSLog(@"test2数据校验成功！！！！！");
    } else {
        NSLog(@"test2数据校验失败！！！！！");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
