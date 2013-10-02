//
// Created by azu on 2013/10/02.
//


#import "GreeterUtil.h"
#import "NSDate+AZDateBuilder.h"


@implementation GreeterUtil {

}
+ (NSDate *)dateWithHour:(NSUInteger) hour minute:(NSUInteger) minute second:(NSUInteger) second {
    return [NSDate AZ_dateByUnit:@{
        AZ_DateUnit.hour : @(hour),
        AZ_DateUnit.minute : @(minute),
        AZ_DateUnit.second : @(second)
    }];
}

@end