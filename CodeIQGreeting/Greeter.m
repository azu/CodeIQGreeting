//
// Created by azu on 2013/10/02.
//


#import "Greeter.h"
#import "GreeterUtil.h"
#import "NSDate+Escort.h"


@implementation Greeter {

}

- (NSDate *)currentDate {
    return [NSDate date];
}

- (BOOL)isMorning {
    NSDate *date = [self currentDate];
    NSDate *beginMorning = [GreeterUtil dateWithHour:5 minute:0 second:0];
    NSDate *endMorning = [GreeterUtil dateWithHour:11 minute:59 second:59];
    if ([date isLaterThanOrEqualDate:beginMorning] && [date isEarlierThanOrEqualDate:endMorning]) {
        return YES;
    }
    return NO;
}

- (BOOL)isAfternoon {
    NSDate *date = [self currentDate];
    NSDate *beginMorning = [GreeterUtil dateWithHour:12 minute:0 second:0];
    NSDate *endMorning = [GreeterUtil dateWithHour:17 minute:59 second:59];
    if ([date isLaterThanOrEqualDate:beginMorning] && [date isEarlierThanOrEqualDate:endMorning]) {
        return YES;
    }
    return NO;
}

- (BOOL)isEvening {
    NSDate *date = [self currentDate];
    NSDate *beginMorning = [GreeterUtil dateWithHour:18 minute:0 second:0];
    NSDate *endMorning = [GreeterUtil dateWithHour:4 minute:59 second:59];
    if ([date isLaterThanDate:endMorning] && [date isEarlierThanDate:beginMorning]) {
        return NO;
    }
    return YES;
}

- (NSString *)greet {
    if ([self isMorning]) {
        return @"おはようございます";
    } else if ([self isAfternoon]) {
        return @"こんにちわ";
    } else if ([self isEvening]) {
        return @"こんにちわ";
    }
    return nil;
}

@end