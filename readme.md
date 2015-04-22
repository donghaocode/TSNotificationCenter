###Type-safe event handling framework.

###TSNotificationCenter__config.h

```objective-c
TSNC_0(test)
TSNC_1(hello,NSString*,name)
TSNC_3(didMove, int, x, int, y, int,z)

```

###TestViewController.m
####self dealloc ---> will auto remove

```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //self dealloc ---> will auto remove
    [self ts_test:^{
        NSLog(@"test");
    }];
    
    [self ts_hello:^(NSString *name) {
        NSLog(@"hello %@",name);
    }];
    
    [self ts_didMove:^(int x, int y, int z) {
        NSLog(@"x=%d  y=%d  z=%d",x,y,z);
    }];
    
    
    [TSNotificationCenter call_test];
    [TSNotificationCenter call_hello_with_name:@"fc01"];
    [TSNotificationCenter call_didMove_with_x:11 y:22 z:33];   
}
```

