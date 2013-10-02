//
// Created by azu on 2013/10/02.
//


#import "Kiwi.h"
#import "Greeter.h"
#import "GreeterUtil.h"

@interface Greeter (TestExtension)
- (void)greetAtDate:(NSDate *) date verify:(void (^)(NSString *)) verify;
@end

@implementation Greeter (TestExtension)
- (void)greetAtDate:(NSDate *) date verify:(void (^)(NSString *)) verify {
    // setup
    [NSDate stub:@selector(date) andReturn:date];
    // expect
    verify([self greet]);
    // teardown
    [NSDate clearStubs];

}
@end

SPEC_BEGIN(GreeterSpec)
    __block Greeter *greeter;
    beforeEach(^{
        greeter = [[Greeter alloc] init];
    });
    describe(@"-greet", ^{
        context(@"When 05:00:00 <= time < 12:00:00", ^{
            it(@"should return おはようございます", ^{
                NSString *expectValue = @"おはようございます";
                [greeter greetAtDate:[GreeterUtil dateWithHour:5 minute:0 second:0] verify:^(NSString *response) {
                    [[response should] equal:expectValue];
                }];
                [greeter greetAtDate:[GreeterUtil dateWithHour:11 minute:59 second:59] verify:^(NSString *response) {
                    [[response should] equal:expectValue];
                }];
            });
        });
        context(@"When 12:00:00 <= time < 18:00:00", ^{
            it(@"should return こんにちわ", ^{
                NSString *expectValue = @"こんにちわ";
                [greeter greetAtDate:[GreeterUtil dateWithHour:12 minute:0 second:0] verify:^(NSString *response) {
                    [[response should] equal:expectValue];
                }];
                [greeter greetAtDate:[GreeterUtil dateWithHour:17 minute:59 second:59] verify:^(NSString *response) {
                    [[response should] equal:expectValue];
                }];
            });
        });
        context(@"When 18:00:00 <= time < 05:00:00", ^{
            it(@"should return こんにちわ", ^{
                NSString *expectValue = @"こんにちわ";
                [greeter greetAtDate:[GreeterUtil dateWithHour:18 minute:0 second:0] verify:^(NSString *response) {
                    [[response should] equal:expectValue];
                }];
                [greeter greetAtDate:[GreeterUtil dateWithHour:4 minute:59 second:59] verify:^(NSString *response) {
                    [[response should] equal:expectValue];
                }];
            });
        });
    });
    SPEC_END