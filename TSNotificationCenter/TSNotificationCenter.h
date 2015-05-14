#import <Foundation/Foundation.h>


#import "metamacros.h"
#define TSNC(...) metamacro_concat(TSNC_,metamacro_argcount(__VA_ARGS__))(__VA_ARGS__)


NS_ROOT_CLASS
@interface TSNotificationCenter

#define TSNC_1(name) \
+(void)call_##name;

#define TSNC_3(name,type1,name1) \
+(void)call_##name##_with_##name1:(type1)name1;

#define TSNC_5(name,type1,name1,type2,name2) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2;

#define TSNC_7(name,type1,name1,type2,name2,type3,name3) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3;

#define TSNC_9(name,type1,name1,type2,name2,type3,name3,type4,name4) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4;

#define TSNC_11(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4 name5:(type5)name5;

#include "TSNotificationCenter__config.h"

#undef TSNC_1
#undef TSNC_3
#undef TSNC_5
#undef TSNC_7
#undef TSNC_9
#undef TSNC_11


@end




@interface NSObject(TSNotificationCenter)
#define TSNC_1(name) \
-(void)ts_##name:(void(^)())block;

#define TSNC_3(name,type1,name1) \
-(void)ts_##name:(void(^)(type1 name1))block;

#define TSNC_5(name,type1,name1,type2,name2) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2))block;

#define TSNC_7(name,type1,name1,type2,name2,type3,name3) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3))block;

#define TSNC_9(name,type1,name1,type2,name2,type3,name3,type4,name4) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4))block;

#define TSNC_11(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
-(void)ts_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4,type5 name5))block;

#include "TSNotificationCenter__config.h"

#undef TSNC_1
#undef TSNC_3
#undef TSNC_5
#undef TSNC_7
#undef TSNC_9
#undef TSNC_11

-(void)ts_regSystemNotificationWithName:(NSString*)name block:(void(^)(NSNotification *notification))block;

@end

