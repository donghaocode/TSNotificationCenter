#import "TSNotificationCenter.h"


@implementation NSObject(TSNotificationCenter)

#define TSNC_0(name) \
-(void)ts_reg_##name:(void(^)())block{}

#define TSNC_1(name,type1,name1) \
-(void)ts_reg_##name:(void(^)(type1 name1))block{}

#define TSNC_2(name,type1,name1,type2,name2) \
-(void)ts_reg_##name:(void(^)(type1 name1,type2 name2))block{}

#define TSNC_3(name,type1,name1,type2,name2,type3,name3) \
-(void)ts_reg_##name:(void(^)(type1 name1,type2 name2,type3 name3))block{}

#define TSNC_4(name,type1,name1,type2,name2,type3,name3,type4,name4) \
-(void)ts_reg_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4))block{}

#define TSNC_5(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
-(void)ts_reg_##name:(void(^)(type1 name1,type2 name2,type3 name3,type4 name4,type5 name5))block{}

#include "TSNotificationCenter__config.h"

#undef TSNC_0
#undef TSNC_1
#undef TSNC_2
#undef TSNC_3
#undef TSNC_4
#undef TSNC_5
@end



@implementation TSNotificationCenter



#define TSNC_0(name,...) \
+(void)call_##name{}

#define TSNC_1(name,type1,name1) \
+(void)call_##name##_with_##name1:(type1)name1{}

#define TSNC_2(name,type1,name1,type2,name2) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2{}

#define TSNC_3(name,type1,name1,type2,name2,type3,name3) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3{}

#define TSNC_4(name,type1,name1,type2,name2,type3,name3,type4,name4) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4{}

#define TSNC_5(name,type1,name1,type2,name2,type3,name3,type4,name4,type5,name5) \
+(void)call_##name##_with_##name1:(type1)name1 name2:(type2)name2 name3:(type3)name3 name4:(type4)name4 name5:(type5)name5{}

#include "TSNotificationCenter__config.h"

#undef TSNC_0
#undef TSNC_1
#undef TSNC_2
#undef TSNC_3
#undef TSNC_4
#undef TSNC_5


-(void)regSystemNotificationWithName:(NSString*)name block:(void(^)(id data))block{
    NSLog(@"___");
}

@end