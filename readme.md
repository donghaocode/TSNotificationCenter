###Type-safe event handling framework

----

###config TSNotificationCenter__config.h
```objective-c 
TSNC_1(hello,NSString*,name)
TSNC_3(test,int,x,int,y,int,z)
```

###reg
```objective-c
//self dealloc ---> will auto remove
[self ts_hello:^(NSString *name) {
    NSLog(@"---------- hello %@",name);
}];

[self ts_test:^(int x, int y, int z) {
    NSLog(@"---------- x=%d  y=%d  z=%d",x,y,z);
}];
```

###call
```objective-c
[TSNotificationCenter call_hello_with_name:@"fc01"];
[TSNotificationCenter call_test_with_x:11 y:22 z:33];
```

----
    
###system notification
```objective-c
//self dealloc ---> will auto remove
[self ts_regSystemNotificationWithName:UIKeyboardWillShowNotification
                                  block:^(NSNotification *notification)
{
    NSLog(@"---------- UIKeyboardWillShowNotification");
}];
```