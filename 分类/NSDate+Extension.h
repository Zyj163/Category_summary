//
//  NSDate+Extension.h
//  Voicedin
//
//  Created by zhangyj on 15-10-15.
//  Copyright (c) 2015年 xitong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  转换date到指定格式
 *
 *  @param formatter 格式定义
 *
 *  @return 转换结果
 */
- (NSString *)convertdateToFormatter:(NSString *)formatter;

/**
 *  将转换到指定格式的date转回date
 *
 *  @param formatter 格式约束
 *  @param dateStr   满足格式的date字符串
 *
 *  @return date
 */
+ (instancetype)dateFromFormatter:(NSString *)formatter WithDateStr:(NSString *)dateStr;
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;
@end
