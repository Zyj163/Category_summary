//
//  UIView+EasyRadius.h
//  YRBorderViewDemo
//
//  Created by zhangyongjun on 16/2/13.
//  Copyright © 2016年 王晓宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EasyRadius)

//内部填充颜色
- (UIView *)setFillColor:(UIColor *)fillColor;
//根据自身形状根据边线进行裁剪
- (UIView *)setClipsToBoundsWithBorder:(BOOL)clipsToBoundsWithBorder;

-(UIView *)setNeedLineTop:(BOOL)needTop left:(BOOL)needLeft bottom:(BOOL)needBottom right:(BOOL)needRight;
-(UIView *)setLineWidthTop:(CGFloat)widthTop left:(CGFloat)widthLeft bottom:(CGFloat)widthBottom right:(CGFloat)widthRight;
-(UIView *)setLineColorTop:(UIColor *)colorTop left:(UIColor *)colorLeft bottom:(UIColor *)colorBottom right:(UIColor *)colorRight;
-(UIView *)setRadiusTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight;

@end
