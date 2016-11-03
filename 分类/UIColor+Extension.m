//
//  UIColor+Extension.m
//  Walker
//
//  Created by zhangyongjun on 16/1/24.
//  Copyright © 2016年 xitong. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

/**将代表十六进制数的字符串转换为颜色*/
+ (UIColor *)colorWithHexString:(NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

/**随机色*/
+ (UIColor *)randomColor {
    CGFloat randomValue = arc4random_uniform(256.);
    return [self colorFrom0_255WithRed:randomValue green:randomValue blue:randomValue];
}

/**传入0~255的数值获取颜色*/
+ (UIColor *)colorFrom0_255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor colorWithRed:(red)/255.0 green:(green)/255.0 blue:(blue)/255.0 alpha:1];
}

/**通过十六进制数获取颜色*/
+ (UIColor *)colorFrom16xRGB:(int)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

@end
