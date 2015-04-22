//
//  ViewController.m
//  demo
//
//  Created by fc01 on 15/4/20.
//  Copyright (c) 2015年 fc01. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "TSNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)pushVc{
    [self.navigationController pushViewController:[[TestViewController alloc]init] animated:YES];
}

@end


