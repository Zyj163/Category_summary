//
//  UIView+Extension.h
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年  tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 *  横向等大小流水线布局
 *
 *  @param views   子视图
 *  @param setting 额外设置
 *  @param insets  子视图与俯视图内边距
 *  @param space   子视图间的距离
 */
- (void)lineLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space;
/**
 *  纵向等大小流水线布局
 *
 *  @param views   子视图
 *  @param setting 额外设置
 *  @param insets  子视图与俯视图内边距
 *  @param space   子视图间的距离
 */
- (void)VlineLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space;
/**
 *  横向非等大小流水线布局
 *
 *  @param views   子视图
 *  @param setting 额外设置
 *  @param insets  子视图与俯视图内边距
 *  @param space   子视图间的距离
 */
- (void)lineButNoEqualWithLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space;
/**
 *  纵向非等大小流水线布局
 *
 *  @param views   子视图
 *  @param setting 额外设置
 *  @param insets  子视图与俯视图内边距
 *  @param space   子视图间的距离
 */
- (void)VlineButNoEqualWithLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space;

@end
