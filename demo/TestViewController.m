//
//  TestViewController.m
//  demo
//
//  Created by fc01 on 15/4/22.
//  Copyright (c) 2015年 fc01. All rights reserved.
//

#import "TestViewController.h"
#import "TSNotificationCenter.h"

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self dealloc ---> will auto remove
    [self ts_test:^{
        NSLog(@"---------- test");
    }];
    
    [self ts_hello:^(NSString *name) {
        NSLog(@"---------- hello %@",name);
    }];
    
    [self ts_didMove:^(int x, int y, int z) {
        NSLog(@"---------- x=%d  y=%d  z=%d",x,y,z);
    }];
    
    
    //system notification
    //self dealloc ---> will auto remove
    [self regSystemNotificationWithName:UIKeyboardWillShowNotification
                                  block:^(NSNotification *notification)
    {
        NSLog(@"---------- UIKeyboardWillShowNotification");
    }];
    
    
    [TSNotificationCenter call_test];
    [TSNotificationCenter call_hello_with_name:@"fc01"];
    [TSNotificationCenter call_didMove_with_x:11 y:22 z:33];
}

@end
