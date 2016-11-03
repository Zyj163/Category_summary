//
//  NSAttributedString+Extension.h
//  Walker
//
//  Created by zhangyj on 15/12/30.
//  Copyright © 2015年 xitong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Extension)

/**
 *  属性字符串
 *
 *  @param string  原字符串
 *  @param height  行高
 *  @param spacing 行间距
 *  @param before  段首间距
 *  @param kern    字间距
 *  @param font    字体大小
 *  @param color   字体颜色
 *  @param range   作用范围
 *
 *  @return 属性字符串
 */
+ (instancetype)AttributedStringWithString:(NSString *)string maxLineHeight:(CGFloat)height lineSpacing:(CGFloat)spacing spacingBefore:(CGFloat)before kern:(NSNumber *)kern andFont:(UIFont *)font fontColor:(UIColor *)color inRange:(NSRange)range;

@end
