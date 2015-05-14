#import "TSNotificationCenter.h"
#import <objc/runtime.h>


@interface __AutoRemove : NSObject
@property(nonatomic,copy)void(^deallocBlock)();
@end

@implementation __AutoRemove
-(void)dealloc{
    if (self.deallocBlock!=nil) {
        self.deallocBlock();
    }
}
@end


@implementation TSNotificationCenter

+(NSMutableDictionary*) getBlockDic{
    static NSMutableDictionary* dic = nil;
    if (dic==nil) {
        dic=[NSMutableDictionary new];
    }
    //dic <string, <string,block> >
    return dic;
}

+(void)addObserver:(id)observer key:(NSString*)key value:(id)value{
    NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];
    NSString *Id=[NSString stringWithFormat:@"(%s_%p)",object_getClassName(observer),observer];
    if (dic[Id]==nil) {
        dic[Id] =[NSMutableDictionary new];
    }
    
    //--------------------------auto remove--------------------------
    static const char *objc_key = "TSNotificationCenterAutoRemove";
    __AutoRemove *ar = objc_getAssociatedObject(observer,objc_key);
    if (ar==nil) {
        ar = [__AutoRemove new];
        ar.deallocBlock=^{
            [TSNotificationCenter removeObserver:Id];
        };
        objc_setAssociatedObject(observer,objc_key, ar, OBJC_ASSOCIATION_RETAIN);
    }
    //--------------------------auto remove--------------------------
    
    
    
    //--------------------------debug--------------------------
    if (dic[Id][key]!=nil) {
        NSLog(@"[TSNotificationCenter] cover %@ %@",Id,key);
    }else{
        NSLog(@"[TSNotificationCenter] reg %@ %@",Id,key);
    }
    //--------------------------debug--------------------------
    
    
    dic[Id][key] = value;
}

+(void)removeObserver:(NSString*)Id{
    NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];
    [dic removeObjectForKey:Id];
    
    //--------------------------debug--------------------------
    NSLog(@"[TSNotificationCenter remove %@",Id);
    //--------------------------debug--------------------------
}


#define TSNC_1(name) \
+(void)call_##name{\
NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];\
for (NSString* d in dic){\
void (^block)() = dic[d][@#name];\
if (block!=nil) {block();}}}


#define TSNC_3(name,type1,name1) \
+(void)call_##name##_with_##name1:(type1)name1{\
NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];\
for (NSString* d in dic){\
void (^block)(type1 name1) = dic[d][@#name];\
if (block!=nil) {block(name1);}}}


#define TSNC_5(name,type1,name1,type2,name2) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2{\
NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2) = dic[d][@#name];\
if (block!=nil) {block(name1,name2);}}}


#define TSNC_7(name,type1,name1,type2,name2,type3,name3) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3{\
NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2,type3 name3) = dic[d][@#name];\
if (block!=nil) {block(name1,name2,name3);}}}


#define TSNC_9(name,type1,name1,type2,name2,type3,name3,type4,name4) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4{\
NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2,type3 name3,type4 name4) = dic[d][@#name];\
if (block!=nil) {block(name1,name2,name3,name4);}}}


#define TSNC_11(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4 name5:(type5)name5{\
NSMutableDictionary *dic = [TSNotificationCenter getBlockDic];\
for (NSString* d in dic){\
void (^block)(type1 name1,type2 name2,type3 name3,type4 name4,type5 name5) = dic[d][@#name];\
if (block!=nil) {block(name1,name2,name3,name4,name5);}}}

#include "TSNotificationCenter__config.h"

#undef TSNC_1
#undef TSNC_3
#undef TSNC_5
#undef TSNC_7
#undef TSNC_9
#undef TSNC_11

@end





@implementation NSObject(TSNotificationCenter)

#define TSNC_1(name) \
-(void)ts_##name:(void(^)())block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_3(name,type1,name1) \
-(void)ts_##name:(void(^)(type1 name1))block \
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_5(name,type1,name1,type2,name2) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_7(name,type1,name1,type2,name2,type3,name3) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_9(name,type1,name1,type2,name2,type3,name3,type4,name4) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#define TSNC_11(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4,type5 name5))block\
{[TSNotificationCenter addObserver:self key:@#name value:block];}

#include "TSNotificationCenter__config.h"

#undef TSNC_1
#undef TSNC_3
#undef TSNC_5
#undef TSNC_7
#undef TSNC_9
#undef TSNC_11




-(void)ts_regSystemNotificationWithName:(NSString*)name block:(void(^)(NSNotification* notification))block{
    
    NSString *Id=[NSString stringWithFormat:@"(%s_%p)",object_getClassName(self),self];
    
    //-----static dic-----//
    static NSMutableDictionary *dic = nil;
    if (dic==nil) {
        dic=[NSMutableDictionary new];
    }
    if (dic[Id]==nil) {
        dic[Id] = [NSMutableArray new];
    }
    [dic[Id] addObject:[[NSNotificationCenter defaultCenter] addObserverForName:name object:nil queue:[NSOperationQueue mainQueue] usingBlock:block]];
    
    
    //--------------------------debug--------------------------
    NSLog(@"[TSNotificationCenter] system add %@ %@",Id,name);
    //--------------------------debug--------------------------
    
    
    //--------------------------auto remove--------------------------
    static const char *objc_key = "SystemNotificationAutoRemove";
    __AutoRemove *ar = objc_getAssociatedObject(self,objc_key);
    if (ar==nil) {
        ar = [__AutoRemove new];
        ar.deallocBlock=^{
            for (id observer in dic[Id]) {
                [[NSNotificationCenter defaultCenter] removeObserver:observer];
            }
            [dic removeObjectForKey:Id];
            
            //--------------------------debug--------------------------
            NSLog(@"[TSNotificationCenter] system remove %@",Id);
            //--------------------------debug--------------------------
            
        };
        objc_setAssociatedObject(self,objc_key, ar, OBJC_ASSOCIATION_RETAIN);
    }
    //--------------------------auto remove--------------------------
    
    
    
}

@end