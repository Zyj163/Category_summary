//
//  UIColor+Extension.h
//  Walker
//
//  Created by zhangyongjun on 16/1/24.
//  Copyright © 2016年 xitong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**将代表十六进制数的字符串转换为颜色*/
+ (UIColor *)colorWithHexString:(NSString *)color;
/**随机色*/
+ (UIColor *)randomColor;
/**传入0~255的数值获取颜色*/
+ (UIColor *)colorFrom0_255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
/**通过十六进制数获取颜色*/
+ (UIColor *)colorFrom16xRGB:(int)rgbValue;

@end
