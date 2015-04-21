//
//  ViewController.m
//  demo
//
//  Created by fc01 on 15/4/20.
//  Copyright (c) 2015年 fc01. All rights reserved.
//

#import "ViewController.h"
#import "TSNotificationCenter.h"





@interface ViewController ()

@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self dealloc ---> will auto remove
    [TSNotificationCenter reg_Hello:self block:^{
        NSLog(@"hello ");
    }];
    
    [TSNotificationCenter reg_Hello:self block:^{
        NSLog(@"hello hello");
    }];
    
    [TSNotificationCenter reg_HelloWorld:self block:^(NSString *title) {
        NSLog(@"hello %@",title);
    }];
    
    [TSNotificationCenter reg_DidScroll:self block:^(float x, float y) {
        NSLog(@"x = %.2f   y = %.2f",x,y);
    }];
    
    
    [TSNotificationCenter call_Hello];
    [TSNotificationCenter call_HelloWorld_with_title:@"哈哈哈哈"];
    [TSNotificationCenter call_DidScroll_with_x:100 y:200];
    
}
@end


