//
//  NSAttributedString+Extension.m
//  Walker
//
//  Created by zhangyj on 15/12/30.
//  Copyright © 2015年 xitong. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

+ (instancetype)AttributedStringWithString:(NSString *)string maxLineHeight:(CGFloat)height lineSpacing:(CGFloat)spacing spacingBefore:(CGFloat)before kern:(NSNumber *)kern andFont:(UIFont *)font fontColor:(UIColor *)color inRange:(NSRange)range {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    
    [style setMaximumLineHeight:height];
    [style setLineSpacing:spacing];
    [style setParagraphSpacingBefore:before];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSParagraphStyleAttributeName] = style;
    
    if (font) {
        attrs[NSFontAttributeName] = font;
    }
    if (color) {
        attrs[NSForegroundColorAttributeName] = color;
    }
    if (kern) {
        attrs[NSKernAttributeName] = kern;
    }
    [attrStr addAttributes:attrs range:range];
    
    return attrStr;
}

@end
