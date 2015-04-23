//
//  TestViewController.m
//  demo
//
//  Created by fc01 on 15/4/22.
//  Copyright (c) 2015年 fc01. All rights reserved.
//

#import "TestViewController.h"
#import "TSNotificationCenter.h"



@interface TestViewController()
@property(nonatomic)IBOutlet UITextField *tf;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self dealloc ---> will auto remove
    [self ts_test:^(int x, int y, int z) {
        NSLog(@"---------- x=%d  y=%d  z=%d",x,y,z);
    }];
    
    //system notification
    //self dealloc ---> will auto remove
    [self ts_regSystemNotificationWithName:UIKeyboardWillShowNotification
                                  block:^(NSNotification *notification)
    {
        NSLog(@"---------- UIKeyboardWillShowNotification");
    }];
    
    
    [TSNotificationCenter call_test_with_x:11 y:22 z:33];
}


-(IBAction)callTest{
    [TSNotificationCenter call_hello_with_name:self.tf.text];
}

@end
