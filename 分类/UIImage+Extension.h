//
//  UIImage+Extension.h
//  kankan
//
//  Created by zhangyj on 15-11-12.
//  Copyright (c) 2015年 xitong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  剪切成原形图片
 *
 *  @param name        图片名
 *  @param bolderColor 边框颜色
 *  @param bolderWidth 边框宽度
 *
 *  @return 原形图片
 */
+ (instancetype)clipImageNamed:(NSString *)name InCircleWithBolderColor:(UIColor *)bolderColor bolderWidth:(CGFloat)bolderWidth;
/**
 *  剪切成原形图片
 *
 *  @param name        图片数据
 *  @param bolderColor 边框颜色
 *  @param bolderWidth 边框宽度
 *
 *  @return 原形图片
 */
+ (instancetype)clipImageData:(NSData *)data InCircleWithBolderColor:(UIColor *)bolderColor bolderWidth:(CGFloat)bolderWidth;

/**
 *  生成可变化大小和颜色的二维码图片
 *
 *  @param str  图片内包含的字符串
 *  @param size 初始图片大小
 *
 *  @return 二维码图片
 */
+ (instancetype)generateCodeWithStr:(NSString *)str size:(CGSize)size withLogo:(UIImage *)logo;

+ (instancetype)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGSize)size;
- (instancetype)imageBlackToTransparentWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;

/**
 *  按比例填充图片颜色
 *
 *  @param percentage    百分比
 *  @param vertical      纵向／横向
 *  @param grayscaleRest 为填充颜色
 *
 *  @return 填充后图片
 */
- (instancetype)partialImageWithPercentage:(float)percentage vertical:(BOOL)vertical grayscaleRest:(BOOL)grayscaleRest;

/**
 *  合并两张图片
 *
 *  @param image1    上图
 *  @param image2    底图
 *
 *  @return 合并后图片
 */
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

/**缩放到指定大小*/
- (UIImage *)scaleToSize:(CGSize)size;
/**获取指定视图的截图*/
+ (UIImage*)imageWithCaptureView:(UIView *)view;
/**按角度旋转图片*/
- (UIImage*)imageRotatedByDegrees:(CGFloat)angle;
/**模糊图片*/
- (UIImage *)imageWithBlurLevel:(CGFloat)blur;
/**模糊图片*/
- (UIImage *)imageWithBlurRadius:(CGFloat)radius;
/**
 *  美化图片
 *
 *  @param brightness 亮度（如果不想改变，传0）
 *  @param saturation 饱和度（如果不想改变，传1）
 *  @param contrast   对比度（如果不想改变，传1）
 *
 *  @return 新图片
 */
- (UIImage *)prettifyImageByBrightness:(CGFloat)brightness saturation:(CGFloat)saturation contrast:(CGFloat)contrast;

@end
