//
//  UIView+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年  tarena. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}



- (void)lineLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space {
    UIView *preView;
    for (NSInteger i = 0; i < views.count; i ++) {
        UIView *view = views[i];
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(insets.top);
            make.bottom.mas_equalTo(-insets.bottom);
        }];
        if (setting) {
            setting(i, view);
        }
        if (i == 0) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(insets.left);
            }];
        }else if (i == views.count - 1) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right).offset(space);
                make.width.equalTo(preView.mas_width);
                make.right.equalTo(self.mas_right).offset(-insets.right);
            }];
        }else {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right).offset(space);
                make.width.equalTo(preView.mas_width);
            }];
        }
        
        preView = view;
    }
}

- (void)lineButNoEqualWithLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space {
    UIView *preView;
    for (NSInteger i = 0; i < views.count; i ++) {
        UIView *view = views[i];
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(insets.top);
            make.bottom.mas_equalTo(-insets.bottom);
        }];
        if (setting) {
            setting(i, view);
        }
        if (i == 0) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(insets.left);
            }];
        }else if (i == views.count - 1) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right).offset(space);
            }];
        }else {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right).offset(space);
            }];
        }
        
        preView = view;
    }
}

- (void)VlineLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space {
    UIView *preView;
    for (NSInteger i = 0; i < views.count; i ++) {
        UIView *view = views[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(insets.left);
            make.right.mas_equalTo(-insets.right);
        }];
        if (setting) {
            setting(i, view);
        }
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(insets.top);
            }];
        }else if (i == views.count - 1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preView.mas_bottom).offset(space);
                make.height.equalTo(preView.mas_height);
                make.bottom.equalTo(self.mas_bottom).offset(-insets.bottom);
            }];
        }else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preView.mas_bottom).offset(space);
                make.height.equalTo(preView.mas_height);
            }];
        }
        
        preView = view;
    }
}

- (void)VlineButNoEqualWithLayout:(NSArray *)views withSetting:(void(^)(NSInteger idx, UIView *view))setting withInset:(UIEdgeInsets)insets andSpace:(CGFloat)space {
    UIView *preView;
    for (NSInteger i = 0; i < views.count; i ++) {
        UIView *view = views[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(insets.left);
            make.right.mas_equalTo(-insets.right);
        }];
        if (setting) {
            setting(i, view);
        }
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(insets.top);
            }];
        }else if (i == views.count - 1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preView.mas_bottom).offset(space);
            }];
        }else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preView.mas_bottom).offset(space);
            }];
        }
        
        preView = view;
    }
}


@end






















