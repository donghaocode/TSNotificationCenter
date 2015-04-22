#import "TSNotificationCenter.h"
#import <objc/runtime.h>


@interface TSNotificationCenterAutoRemove : NSObject
@property(nonatomic,copy)void(^onDealloc)();
@end

@implementation TSNotificationCenterAutoRemove
-(void)dealloc{
    if (self.onDealloc!=nil) {
        self.onDealloc();
    }
}
@end


@implementation TSNotificationCenter

+(NSMutableDictionary*) getDic{
    static NSMutableDictionary* dic = nil;
    if (dic==nil) {
        dic=[[NSMutableDictionary alloc]init];
    }
    return dic;
}

+(void)addObserver:(id)observer key:(NSString*)key value:(id)value{
    NSMutableDictionary *dic = [TSNotificationCenter getDic];
    NSString *Id=[NSString stringWithFormat:@"(%s_%p)",object_getClassName(observer),observer];
    if (dic[Id]==nil) {
        dic[Id] =[[NSMutableDictionary alloc]init];
    }
    
    //--------------------------auto remove--------------------------
    static const char *objc_key = "TSNotificationCenterAutoRemove";
    TSNotificationCenterAutoRemove *ar = objc_getAssociatedObject(observer,objc_key);
    if (ar==nil) {
        ar = [[TSNotificationCenterAutoRemove alloc]init];
        ar.onDealloc=^{
            [TSNotificationCenter removeObserver:Id];
        };
        objc_setAssociatedObject(observer,objc_key, ar, OBJC_ASSOCIATION_RETAIN);
    }
    //--------------------------auto remove--------------------------
    
    
    
    //--------------------------debug--------------------------
    if (dic[Id][key]!=nil) {
        NSLog(@"cover %@ %@",Id,key);
    }else{
        NSLog(@"reg %@ %@",Id,key);
    }
    //--------------------------debug--------------------------
    
    
    dic[Id][key] = value;
}

+(void)removeObserver:(NSString*)Id{
    NSMutableDictionary *dic = [TSNotificationCenter getDic];
    [dic removeObjectForKey:Id];
    
    //--------------------------debug--------------------------
    NSLog(@"remove %@",Id);
    //--------------------------debug--------------------------
}


#define TSNC_0(name,...) \
+(void)call_##name{\
NSMutableDictionary *dic = [TSNotificationCenter getDic];\
for (NSString* d in dic){\
void (^block)() = dic[d][@#name];\
if (block!=nil) {block();}}}


#define TSNC_1(name,type1,name1) \
+(void)call_##name##_with_##name1:(type1)name1{\
NSMutableDictionary *dic = [TSNotificationCenter getDic];\
for (NSString* d in dic){\
void (^block)(type1 name1) = dic[d][@#name];\
if (block!=nil) {block(name1);}}}


#define TSNC_2(name,type1,name1,type2,name2) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2{\
NSMutableDictionary *dic = [TSNotificationCenter getDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2) = dic[d][@#name];\
if (block!=nil) {block(name1,name2);}}}


#define TSNC_3(name,type1,name1,type2,name2,type3,name3) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3{\
NSMutableDictionary *dic = [TSNotificationCenter getDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2,type3 name3) = dic[d][@#name];\
if (block!=nil) {block(name1,name2,name3);}}}


#define TSNC_4(name,type1,name1,type2,name2,type3,name3,type4,name4) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4{\
NSMutableDictionary *dic = [TSNotificationCenter getDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2,type3 name3,type4 name4) = dic[d][@#name];\
if (block!=nil) {block(name1,name2,name3,name4);}}}


#define TSNC_5(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4 name5:(type5)name5{\
NSMutableDictionary *dic = [TSNotificationCenter getDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2,type3 name3,type4 name4,type5 name5) = dic[d][@#name];\
if (block!=nil) {block(name1,name2,name3,name4,name5);}}}

#include "TSNotificationCenter__config.h"

#undef TSNC_0
#undef TSNC_1
#undef TSNC_2
#undef TSNC_3
#undef TSNC_4
#undef TSNC_5

@end





@implementation NSObject(TSNotificationCenter)

#define TSNC_0(name) \
-(void)ts_##name:(void(^)())block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_1(name,type1,name1) \
-(void)ts_##name:(void(^)(type1 name1))block \
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_2(name,type1,name1,type2,name2) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_3(name,type1,name1,type2,name2,type3,name3) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_4(name,type1,name1,type2,name2,type3,name3,type4,name4) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_5(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4,type5 name5))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#include "TSNotificationCenter__config.h"

#undef TSNC_0
#undef TSNC_1
#undef TSNC_2
#undef TSNC_3
#undef TSNC_4
#undef TSNC_5

@end