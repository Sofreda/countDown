//
//  FRCountDown.h
//  Demo
//
//  Created by Freda on 2016/12/21.
//  Copyright © 2016年 freda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FRCountDown : NSObject
///用NSDate日期倒计时
-(void)countDownWithStratDate:(NSDate *)startDate finishDate:(NSDate *)finishDate completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;
///用时间戳倒计时
-(void)countDownWithStratTimeStamp:(long long)starTimeStamp finishTimeStamp:(long long)finishTimeStamp completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;
///每秒走一次，回调block
-(void)countDownWithPER_SECBlock:(void (^)())PER_SECBlock;
//自定义时间
-(void)countDownWithTimeInterval:(uint64_t)time timeBlock:(void (^)())timeBlock;
//获取到现在为止的时间
- (double)getNowTimeWithString:(NSString *)aTimeString;
//根据时间转换为00：00：00
- (NSString *)countDownTime:(double)timeInterval;

-(void)destoryTimer;
-(NSDate *)dateWithLongLong:(long long)longlongValue;
@end
