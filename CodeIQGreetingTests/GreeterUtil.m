//
// Created by azu on 2013/10/02.
//


#import "GreeterUtil.h"


@implementation GreeterUtil {

}
+ (NSDate *)dateWithHour:(NSUInteger) hour minute:(NSUInteger) minute second:(NSUInteger) second {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Tokyo"];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[NSDate date]];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    return [calendar dateFromComponents:components];
}

@end