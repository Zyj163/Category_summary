//
//  UIView+EasyRadius.m
//  YRBorderViewDemo
//
//  Created by zhangyongjun on 16/2/13.
//  Copyright © 2016年 王晓宇. All rights reserved.
//

#import "UIView+EasyRadius.h"
#import "YRBorderView.h"
#import <objc/runtime.h>

@interface UIView ()

@property (weak, nonatomic) YRBorderView *borderView;

@end

static const char *BorderViewKey = "BorderViewKey";
@implementation UIView (EasyRadius)

- (void)setBorderView:(YRBorderView *)borderView
{
    objc_setAssociatedObject(self, &BorderViewKey, borderView, OBJC_ASSOCIATION_ASSIGN);
}

- (YRBorderView *)borderView
{
    YRBorderView *borderView = objc_getAssociatedObject(self, &BorderViewKey);
    if (!borderView)
    {
        borderView = [[YRBorderView alloc]initWithFrame:self.frame];
        self.borderView = borderView;
        NSAssert([self.superview isKindOfClass:[UIView class]], @"%@ must have a superview", self);
        [self.superview addSubview:borderView];
        [self removeFromSuperview];
        [borderView addSubview:self];
    }
    return borderView;
}

//内部填充颜色
- (UIView *)setFillColor:(UIColor *)fillColor
{
    self.borderView.fillColor = fillColor;
    return self.borderView;
}
//根据自身形状根据边线进行裁剪
- (UIView *)setClipsToBoundsWithBorder:(BOOL)clipsToBoundsWithBorder
{
    self.borderView.clipsToBoundsWithBorder = clipsToBoundsWithBorder;
    return self.borderView;
}

-(UIView *)setNeedLineTop:(BOOL)needTop left:(BOOL)needLeft bottom:(BOOL)needBottom right:(BOOL)needRight
{
    [self.borderView setNeedLineTop:needTop left:needLeft bottom:needBottom right:needRight];
    return self.borderView;
}

-(UIView *)setLineWidthTop:(CGFloat)widthTop left:(CGFloat)widthLeft bottom:(CGFloat)widthBottom right:(CGFloat)widthRight
{
    [self.borderView setLineWidthTop:widthTop left:widthLeft bottom:widthBottom right:widthRight];
    return self.borderView;
}

-(UIView *)setLineColorTop:(UIColor *)colorTop left:(UIColor *)colorLeft bottom:(UIColor *)colorBottom right:(UIColor *)colorRight
{
    [self.borderView setLineColorTop:colorTop left:colorLeft bottom:colorBottom right:colorRight];
    return self.borderView;
}

-(UIView *)setRadiusTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight
{
    [self.borderView setRadiusTopLeft:topLeft topRight:topRight bottomLeft:bottomLeft bottomRight:bottomRight];
    return self.borderView;
}

@end
